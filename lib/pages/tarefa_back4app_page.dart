import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/model/tarefas_back4app_model.dart';

import '../apis/dio/tarefas_back4app_api.dart';
import '../model/tarefa_model.dart';
import '../repository/sqflitte/tarefa_repository.dart';


class TarefaBack4App extends StatefulWidget {
  const TarefaBack4App({Key? key}) : super(key: key);

  @override
  State<TarefaBack4App> createState() => _TarefaBack4AppState();
}

class _TarefaBack4AppState extends State<TarefaBack4App> {

  late TarefasBack4AppModel _tarefasBack4App = TarefasBack4AppModel([]);
  var descricaoContoller = TextEditingController();
  var apenasNaoConcluidos = false;
  late TarefasBack4AppApi tarefasBack4AppApi;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    tarefasBack4AppApi = TarefasBack4AppApi();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {loading = true;});
    _tarefasBack4App = await tarefasBack4AppApi.getAllByConcluido(apenasNaoConcluidos);
    print(_tarefasBack4App);
    setState(() {loading = false;});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Tarefas com API")),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              descricaoContoller.text = "";
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: const Text("Adicionar tarefa"),
                      content: TextField(
                        controller: descricaoContoller,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar")),
                        TextButton(
                            onPressed: () async {
                             // await tarefaRepository.salvar(TarefaModel(
                              //    0,  false, descricaoContoller.text));
                              Navigator.pop(context);
                              obterTarefas();
                              setState(() {});
                            },
                            child: const Text("Salvar"))
                      ],
                    );
                  });
            },
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Apenas não concluídos",
                        style: TextStyle(fontSize: 18),
                      ),
                      Switch(
                          value: apenasNaoConcluidos,
                          onChanged: (bool value) {
                            apenasNaoConcluidos = value;
                            obterTarefas();
                          })
                    ],
                  ),
                ),
                loading ? const CircularProgressIndicator() : Expanded(
                  child: ListView.builder(
                      itemCount: _tarefasBack4App.tarefas.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = _tarefasBack4App.tarefas[index];
                        return Dismissible(
                          onDismissed: (DismissDirection dismissDirection) async {
                            //tarefaRepository.deletar(tarefa.id);
                            obterTarefas();
                          },
                          key: Key(tarefa.descricao),
                          child: ListTile(
                            title: Text(tarefa.descricao),
                            trailing: Switch(
                              onChanged: (bool value) async {
                                tarefa.concluida = value;
                                //tarefaRepository.atualizar(tarefa);
                                obterTarefas();
                              },
                              value: tarefa.concluida,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
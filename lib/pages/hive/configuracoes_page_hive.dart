import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/model/configuracoes_model.dart';
import 'package:projeto_dio_flutter/repository/hive/configuracoes_repository_hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {

  late ConfiguracoesRepositoryHive configuracoesRepositoryHive;
  var configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nameUserController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    carregarDados();
    // TODO: implement initState
    super.initState();
  }

  void carregarDados() async{
    configuracoesRepositoryHive = await ConfiguracoesRepositoryHive.carregar();
    configuracoesModel = configuracoesRepositoryHive.getConfiguracoes();

    setState(() {
      nameUserController.text = configuracoesModel.nomeUsuario;
      alturaController.text = configuracoesModel.altura.toString();

    });


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(title: const Text("Configurações Hive"),),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Usuario"
                ),
                controller: nameUserController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Altura",

                ),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
                title: const Text("Receber NOtificação"),
                value: configuracoesModel.receberNOtificacoes,
                onChanged: (bool value){
                  setState(() {
                    configuracoesModel.receberNOtificacoes = value;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value:  configuracoesModel.temaEscuro,
                onChanged: (bool value){
                  setState(() {
                    configuracoesModel.temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try{
                     configuracoesModel.altura = double.parse(alturaController.text);
                  }catch(e){
                    showDialog(context: context , builder: (_){
                      return AlertDialog(
                        title: const Text("ERRO"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);

                          }, child: const Text("OK")),
                          TextButton(onPressed: (){
                            Navigator.pop(context);

                          }, child: const Text("CANCELAR"))
                        ],
                      );
                    });
                    return;
                  }
                  configuracoesModel.nomeUsuario =  nameUserController.text;

                  configuracoesRepositoryHive.salvar(configuracoesModel);
                   if(mounted) {
                    Navigator.pop(context);
                  }

                }, child: const Text("SALVAR"))
          ],
        ),
      ),
    ),

    );
  }
}


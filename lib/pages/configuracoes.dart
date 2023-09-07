import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {

  final KEY_USUARIO = "KEY_USUARIO";
  final KEY_ALTURA = "KEY_ALTURA";
  final KEY_NOTIFICACOES = "KEY_NOTIFICACOES";
  final KEY_MODO_ESCURO = "KEY_MODO_ESCURO";

  String? nameUsuario;
  double? altura;
  bool receberNOtification = false;
  bool temaEscuro = false;

  TextEditingController nameUserController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  late  SharedPreferences storage;



  @override
    void initState() {
    carregarDados();
      // TODO: implement initState
      super.initState();
    }

    void carregarDados() async{
      storage = await SharedPreferences.getInstance();
      setState(() {
        nameUserController.text = storage.getString(KEY_USUARIO) ?? "";
        alturaController.text = (storage.getDouble(KEY_ALTURA) ?? 0).toString();
        receberNOtification = storage.getBool(KEY_NOTIFICACOES) ?? false;
        temaEscuro = storage.getBool(KEY_MODO_ESCURO) ?? false;
      });


    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(title: const Text("Configurações"),),
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
                value: receberNOtification,
                onChanged: (bool value){
                  setState(() {
                    receberNOtification = !receberNOtification;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: temaEscuro,
                onChanged: (bool value){
                  setState(() {
                    temaEscuro = !temaEscuro;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try{
                   await storage.setDouble(KEY_ALTURA, double.parse(alturaController.text));
                  }catch(e){
                    showDialog(context: context , builder: (_){
                      return AlertDialog(
                        title: const Text("ERR"),
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
                  await storage.setString(KEY_USUARIO, nameUserController.text);
                  await storage.setBool(KEY_MODO_ESCURO, temaEscuro);
                  await storage.setBool(KEY_NOTIFICACOES, receberNOtification);

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

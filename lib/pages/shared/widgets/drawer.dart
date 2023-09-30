
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto_dio_flutter/apis/dio/tarefas_back4app_api.dart';
import 'package:projeto_dio_flutter/pages/auto_size_page.dart';
import 'package:projeto_dio_flutter/pages/cep_page.dart';
import 'package:projeto_dio_flutter/pages/configuracoes.dart';
import 'package:projeto_dio_flutter/pages/hive/configuracoes_page_hive.dart';
import 'package:projeto_dio_flutter/pages/hive/random_page_hive.dart';
import 'package:projeto_dio_flutter/pages/marvel_page.dart';
import 'package:projeto_dio_flutter/pages/percentage_page.dart';
import 'package:projeto_dio_flutter/pages/random_page.dart';
import 'package:projeto_dio_flutter/pages/splash_01.dart';
import 'package:projeto_dio_flutter/pages/tarefa_back4app_page.dart';
import 'package:projeto_dio_flutter/pages/tarefa_sqlite_page.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:
        [
          InkWell(
            onTap:(){
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                  context: context,
                  builder: (BuildContext context){
                    return  Wrap(
                      children:  [
                        ListTile(
                          onTap: (){
                            print("CAMERA");
                          },
                          title: const Text("CAmera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: (){
                            print("GAleria");
                          },
                          title: const Text("GAleria"),
                          leading: const Icon(Icons.browse_gallery),
                        )
                      ],
                    );
                  });
            } ,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3)
              ),
                currentAccountPicture:
                          CircleAvatar(
                            backgroundColor: Colors.white,
                              child: Image.network(
                                           "https://hermes.digitalinnovation.one/assets/diome/logo.png"
                                      )),
                accountName: const Text("Matheus Hardman"),
                accountEmail: const Text("burumungu@gmail.com")),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
              onTap: (){
                print("USUARIO");
              },
              child: Row(
                children:  const[
                  Icon(Icons.person),
                  SizedBox(width: 20),
                  Text("USUARIO"),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const ConfiguracoesPage()));              },
              child: Row(
                      children:  const[
                      Icon(Icons.security_update),
                      SizedBox(width: 20),
                      Text("CONFIGURAÇÕES"),
                      ],)
            ),
          ),
          ///Config Hive
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const ConfiguracoesHivePage()));              },
                child: Row(
                  children:  const[
                    Icon(Icons.security_update),
                    SizedBox(width: 20),
                    Text("CONFIGURAÇÕES HIVE"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const RandomPage()));
                },
                child: Row(
                  children:  const[
                    Icon(Icons.menu),
                    SizedBox(width: 20),
                    Text("RANDOM"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const RandomPageHive()));
                },
                child: Row(
                  children:  const[
                    Icon(Icons.menu),
                    SizedBox(width: 20),
                    Text("RANDOM HIVE"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const TarefaSQLitePage()));
                },
                child: Row(
                  children:  const[
                    Icon(Icons.menu),
                    SizedBox(width: 20),
                    Text("TAREFAS"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const CepPage()));
                },
                child: Row(
                  children:  const[
                    Icon(Icons.post_add),
                    SizedBox(width: 20),
                    Text("BUSCA CEP"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const MarvelPage()));
                },
                child: Row(
                  children:  const[
                    Icon(Icons.post_add),
                    SizedBox(width: 20),
                    Text("MARVEL"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: () async{
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const TarefaBack4App()));
                },
                child: Row(
                  children:  const[
                    Icon(Icons.post_add),
                    SizedBox(width: 20),
                    Text("TAREFAS BACK4APP"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: () async{
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const PercentagePage()));
                },
                child: Row(
                  children:  const[
                    FaIcon(FontAwesomeIcons.percent),
                    SizedBox(width: 20),
                    Text("PERCENTAGE"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: () async{
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const AutoSizePage()));
                },
                child: Row(
                  children:  const[
                    FaIcon(FontAwesomeIcons.textWidth),
                    SizedBox(width: 20),
                    Text("AUT SIZE TEXT"),
                  ],)
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: () async{
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=> const Splash01()));
                },
                child: Row(
                  children:  const[
                    FaIcon(FontAwesomeIcons.unsplash),
                    SizedBox(width: 20),
                    Text("SPLASH"),
                  ],)
            ),
          ),
          const Divider(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: (){
                  _alertSair();
                },
                child: Row(
                  children:  const[
                    Icon(Icons.exit_to_app_rounded),
                    SizedBox(width: 20),
                    Text("SAIR"),
                  ],)
            ),
          ),

        ],
      ),
    );
  }
  _alertSair(){

    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.centerLeft,
        elevation: 8,
        title: const Text("APP"),
        content: Wrap(
          children: const [
            Text("Deseja Sair!"),
            Text("Deseja realmente sair?")
          ],
        ),
        actions: [
          TextButton(
              onPressed: (){
                // Navigator.pushReplacement(
                //context,
                //  MaterialPageRoute(builder: (context)=> const Logi))
                print("SAINDOOOOO");
              }, child: const Text("SIM")),
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text("NÃO"))
        ],
      );
    });

  }
}

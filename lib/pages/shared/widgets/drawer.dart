
import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/pages/configuracoes.dart';
import 'package:projeto_dio_flutter/pages/random_page.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          )
        ],
      ),
    );
  }
}

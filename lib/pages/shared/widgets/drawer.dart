
import 'package:flutter/material.dart';

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
          UserAccountsDrawerHeader(
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
                print("CONFIGURAÇÕES");
              },
              child: Row(
                      children:  const[
                      Icon(Icons.menu),
                      SizedBox(width: 20),
                      Text("CONFIGURAÇÕES"),
                      ],)
            ),
          )
        ],
      ),
    );
  }
}

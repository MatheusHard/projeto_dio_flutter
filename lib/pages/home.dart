import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/pages/card_detail_page.dart';
import 'package:projeto_dio_flutter/pages/card_page.dart';
import 'package:projeto_dio_flutter/pages/listview_h.dart';
import 'package:projeto_dio_flutter/pages/page3.dart';
import 'package:projeto_dio_flutter/pages/shared/widgets/drawer.dart';
import 'package:projeto_dio_flutter/pages/usuario.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("FF")),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value){
                  setState((){
                    posicaoPagina = value;
                  });

                } ,
                children:const [
                  CardPage(),
                  UsuarioPage(),
                  ListViewH()
                ]),
            ),
            BottomNavigationBar(
              onTap: (value){
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem( label: "Card", icon: Icon(Icons.card_giftcard)),
                  BottomNavigationBarItem( label: "Usuario", icon: Icon(Icons.supervised_user_circle_outlined)),
                  BottomNavigationBarItem( label: "ListView", icon: Icon(Icons.list))

                ],
            ),
          ]

    ),
    drawer: const DrawerCustom()
    );

  }
}

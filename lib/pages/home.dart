import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/pages/card_page.dart';
import 'package:projeto_dio_flutter/pages/listview_horizontal.dart';
import 'package:projeto_dio_flutter/pages/listview_vertical.dart';
import 'package:projeto_dio_flutter/pages/shared/widgets/drawer.dart';
import 'package:projeto_dio_flutter/pages/usuario.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  int posicaoPagina = 0;
  late TabController tabController;
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("FF")),
        body: TabBarView(
            controller: tabController,
            children: const [
              CardPage(),
              UsuarioPage(),
              ListViewVertical(),
              ListViewHorizontal()

            ]),
        drawer: const DrawerCustom(),
        bottomNavigationBar:  ConvexAppBar(
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.supervised_user_circle, title: 'Usuario'),
            TabItem(icon: Icons.list, title: 'Lista'),
            TabItem(icon: Icons.list_alt_sharp, title: 'Lista'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) => tabController.index = i,
          controller: tabController,
        )
    );

  }
}
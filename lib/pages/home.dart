import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/pages/card_page.dart';
import 'package:projeto_dio_flutter/pages/shared/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("FF")),
        body: const CardPage(),
        drawer: DrawerCustom(),
    );

  }
}

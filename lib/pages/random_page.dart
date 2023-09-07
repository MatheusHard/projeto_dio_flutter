import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  var numeGerado = 0;
  var clics = 0;
  late  SharedPreferences storage;
  final NUMERO_GERADO = "numero_gerado";
  final CLICS = "clics";

  @override
  void initState() {
    // TODO: implement initState
    carregarShared();
    super.initState();
  }
  void carregarShared() async{
    storage = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GERAR RANDOM"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(numeGerado.toString(), style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async{
            var random = Random();
            setState(() {
              numeGerado = random.nextInt(500);
              clics += 1;
            });
            storage.setInt(NUMERO_GERADO, numeGerado);
            storage.setInt(CLICS, clics);





            print("NUMER: ${ storage.getInt(NUMERO_GERADO)} ");
            print("CICS: ${ storage.getInt(CLICS)} ");

          },
        ),
      ),
    );
  }
}

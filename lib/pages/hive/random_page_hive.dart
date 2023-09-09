import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomPageHive extends StatefulWidget {
  const RandomPageHive({super.key});

  @override
  State<RandomPageHive> createState() => _RandomPageHiveState();
}

class _RandomPageHiveState extends State<RandomPageHive> {
  var numeGerado = 0;
  var clics = 0;
  late  Box boxNumerosAleatorios;
  final NUMERO_GERADO = "numero_gerado";
  final CLICS = "clics";

  @override
  void initState() {
    // TODO: implement initState
    carregarHive();
    super.initState();
  }
  void carregarHive() async{
    if(Hive.isBoxOpen("box_numeros_aleatorios")){
      boxNumerosAleatorios = Hive.box("box_numeros_aleatorios");
    }else {
      boxNumerosAleatorios = await Hive.openBox("box_numeros_aleatorios");
    }
    numeGerado = await boxNumerosAleatorios.get(NUMERO_GERADO) ?? 0;
    clics = await boxNumerosAleatorios.get(CLICS) ?? 0;
    setState(() {});

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
              ),),
              Text('Clics: $clics', style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
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
            boxNumerosAleatorios.put(NUMERO_GERADO, numeGerado);
            boxNumerosAleatorios.put(CLICS, clics);







          },
        ),
      ),
    );
  }
}

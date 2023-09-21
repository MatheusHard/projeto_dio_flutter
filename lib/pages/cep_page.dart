import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/apis/cep_api.dart';
import 'package:projeto_dio_flutter/apis/placeholder_api.dart';
import 'package:projeto_dio_flutter/model/cep_model.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {

  var cepController = TextEditingController( text: "");
  var cep = "";
  bool loading = false;
  var logradouro = "";
  var cidade = "";
  var uf = "";
  var cepModel = CepModel();
  var cepApi =  CepApi();
  var placeHolderApi = PlaceHolderApi();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("BUsca CEP")),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                setState(() {
                  loading = true;
                });
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if(cep.length == 8){


                 cepModel = await cepApi.getByCep(cep);
                 ///TESTES
                  var lista = await placeHolderApi.getAll();
                  print(lista);

                }
                setState(() {loading= false;});
              },
            ),
            const SizedBox(height: 50,),
            Text(cepModel.logradouro ?? ""),
            Text('''${ cepModel.localidade ?? ""} - ${cepModel.uf ?? ""}'''),

            Visibility(
              visible: loading,
                child: const Center(child: CircularProgressIndicator()))
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {

  var cepController = TextEditingController( text: "");
  var cep = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("BUsca CEP")),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if(cep.length == 8){

                 var response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
                 print(response.body);
                }
                setState(() {});
              },
            ),
            const SizedBox(height: 50,),
            Text('''$cep''')
          ],
        ),
      ),
    ));
  }
}

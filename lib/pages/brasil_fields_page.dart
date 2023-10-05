import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {

  TextEditingController cepController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController centavosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Brasil Fields"),),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("CEP"),
            TextFormField(
               controller: cepController,
               keyboardType: TextInputType.number,
                inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
            ],
          ),
            const SizedBox(width: 20,height: 20,),
            const Text("CPF"),
            TextFormField(
              controller: cpfController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            const SizedBox(width: 20,height: 20,),
            const Text("CENTAVOS"),
            TextFormField(
              controller: centavosController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter(moeda: true)              ],
            ),
            Center(
              child: TextButton(onPressed:(){
                print(CPFValidator.isValid(cpfController.text));
              }, child: const Text("VALIDAR")),
            )
          ],
        ),
      ),
    ));
  }
}

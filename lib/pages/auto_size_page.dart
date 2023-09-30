import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizePage extends StatefulWidget {
  const AutoSizePage({super.key});

  @override
  State<AutoSizePage> createState() => _AutoSizePageState();
}

class _AutoSizePageState extends State<AutoSizePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(title: const Text("Auto Size"),),
      body:  Column(
        children: [
          TextField(
            controller: controller,
            onChanged: (value){
              setState(() {

              });
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: 200,
            height: 200,
            child: Card(
              elevation: 7,
              child: AutoSizeText(controller.text, maxLines: 2),
            ),
          ),
        ],
      ),
    ));
  }
}

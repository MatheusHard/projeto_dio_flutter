import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Splash01 extends StatefulWidget {
  const Splash01({super.key});

  @override
  State<Splash01> createState() => _Splash01State();
}

class _Splash01State extends State<Splash01> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Splash Screen"),),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.yellow, Colors.purple])
        ),
        child: Center(
          child: SizedBox(
            width: 350.0,
            child: TextLiquidFill(
              loadDuration: const Duration(seconds: 20),
              text: 'LIQUIDY',
              waveColor: Colors.blueAccent,
              boxBackgroundColor: Colors.redAccent,
              textStyle: const TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300.0,
            ),
          ),
        ),
      ),
    ));
  }
}

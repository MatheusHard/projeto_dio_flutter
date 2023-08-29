import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/pages/home.dart';

void main() async {

  runApp(
    MaterialApp(
      title: 'DIO',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home_page': (BuildContext context) => const Home(),

      },
      initialRoute: '/home_page',
    ));
}


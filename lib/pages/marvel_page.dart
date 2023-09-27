import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/apis/dio/marvel_api.dart';

class MarvelPage extends StatefulWidget {
  const MarvelPage({super.key});

  @override
  State<MarvelPage> createState() => _MarvelPageState();
}


class _MarvelPageState extends State<MarvelPage> {
  var apiMarvel = MarvelApi();
  @override
  void initState() {
    // TODO: implement initState
    carregarDados();
    super.initState();
  }
  carregarDados() async{
    var lista = await apiMarvel.getCharacters();
    print(lista);
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

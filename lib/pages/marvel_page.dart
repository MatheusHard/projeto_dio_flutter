import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/apis/dio/marvel_api.dart';
import 'package:projeto_dio_flutter/model/characters_model.dart';

class MarvelPage extends StatefulWidget {
  const MarvelPage({super.key});

  @override
  State<MarvelPage> createState() => _MarvelPageState();
}


class _MarvelPageState extends State<MarvelPage> {
  late MarvelApi marvelApi;
  CharactersModel charactersModel = CharactersModel();
  int offset = 0;
  bool loading = false;
  //PAginar auto
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      var posicaoParaPAginar = _scrollController.position.maxScrollExtent * 0.7;
      if( _scrollController.position.pixels >  posicaoParaPAginar ){
        carregarDados();
      }


    });
    marvelApi = MarvelApi();
    carregarDados();
    super.initState();
  }
  carregarDados() async{
    
    if(loading) return;
    if(charactersModel.data == null || charactersModel.data!.results == null){
      charactersModel = await marvelApi.getCharacters(offset);
    }else{
      setState(() {loading = true;});
      offset += charactersModel.data!.count!;
      var tempLista = await marvelApi.getCharacters(offset);
      charactersModel.data!.results!.addAll(tempLista.data!.results!);
      loading = false;
    }

    setState(() {});
    print(charactersModel);
  }
  int totalCharacters(){
    try{
      return charactersModel.data!.total!;
      }catch(e){
      return 0;
    }
  }
  int totalAtualCharacters(){
    try{
      return offset + charactersModel.data!.count!;
    }catch(e){
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Marvel Comics ${totalAtualCharacters().toString()} / ${totalCharacters().toString()}"),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: charactersModel.data == null ? 0 : charactersModel.data!.results!.length,
                itemBuilder: (_, int index){
                var character = charactersModel.data!.results![index];
              return Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network("${character.thumbnail!.path!}.${character.thumbnail!.extension!}", width: 100, height: 100,),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(character.name!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                Text(character.description!)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              );
            }),
          ),
          !loading ? ElevatedButton(onPressed: (){
            carregarDados();
          }, child: const Text("Paginar")
          ) : const CircularProgressIndicator()
        ],
      ),
      
    ));
  }
}

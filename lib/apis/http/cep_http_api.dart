import 'dart:convert';

import '../../model/cep_model.dart';
import 'package:http/http.dart' as http;


class CepHttpApi{

  Future<CepModel> getByCep(String cep)async{
    var response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      return CepModel.fromJson(json);
    }else{
      return CepModel();
    }


  }
}
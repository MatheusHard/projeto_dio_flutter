import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_dio_flutter/model/post_model.dart';

class PlaceHolderApi{

  Future<List<PostModel>> getAll() async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if(response.statusCode == 200){
      var jsonPosts = jsonDecode(response.body);
      return (jsonPosts as List).map((p) => PostModel.fromJson(p)).toList();
    }else{
      return [];
    }


  }
}
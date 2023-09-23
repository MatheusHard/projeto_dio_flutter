import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_dio_flutter/model/post_model.dart';

import '../dio/interfaces_api/i_post_api.dart';

class PostHttpApi  implements IPostDioApi{

  @override
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
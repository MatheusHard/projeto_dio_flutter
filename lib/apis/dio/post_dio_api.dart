import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_dio_flutter/apis/dio/configurations/post_custom_dio.dart';
import 'package:projeto_dio_flutter/apis/dio/interfaces_api/i_post_api.dart';
import 'package:projeto_dio_flutter/model/post_model.dart';

class PostDioApi implements IPostDioApi{


  @override
  Future<List<PostModel>> getAll() async{
    var postCustomDio = PostCustomDio();
    var response = await postCustomDio.dio.get("/posts");

    if(response.statusCode == 200){
      return (response.data as List).map((p) => PostModel.fromJson(p)).toList();
    }else{
      return [];
    }


  }
}
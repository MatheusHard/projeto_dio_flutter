import 'package:dio/dio.dart';

class PostCustomDio {

  final _dio = Dio();

  get dio => _dio;

   PostCustomDio(){
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }
}
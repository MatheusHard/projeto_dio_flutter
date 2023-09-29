import 'package:dio/dio.dart';
import 'package:projeto_dio_flutter/model/tarefas_back4app_model.dart';

class TarefasBack4AppApi{
  Future<TarefasBack4AppModel> getAllByConcluido(bool concluido) async{
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] = "dkQpjL9UrLtmVQGCSu3MDXgq4ZiPQzY9HbrjXBSq";
    dio.options.headers["X-Parse-REST-API-Key"] = "OJhmqZWPhUQSae0f87mASDvI7tjwFp7DJ0iRmSOT";
    dio.options.headers["Content-Type"] = "application/json";
    var url = "https://parseapi.back4app.com/classes/Tarefas";

    if(concluido){
      url+="?where={\"concluida\":true}";
    }
    var result = await dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }
}

import 'package:projeto_dio_flutter/model/post_model.dart';

abstract class IPostDioApi{

  Future<List<PostModel>> getAll();
}
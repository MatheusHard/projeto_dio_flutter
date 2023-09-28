import 'dart:convert';
import 'package:convert/convert.dart' as hex;
import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projeto_dio_flutter/model/characters_model.dart';

class MarvelApi{

Future<CharactersModel> getCharacters(int offset) async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = dotenv.get("PUBLIC_KEY");
    var privateKey = dotenv.get("PRIVATE_KEY");

    var hashocal =_generateMd5(ts+privateKey+publicKey);
    var query = "offset=$offset&ts=$ts&apikey=$publicKey&hash=$hashocal";
    var result = await dio.get("http://gateway.marvel.com/v1/public/characters?$query");
    var lista = CharactersModel.fromJson(result.data);

  return lista;
}
  _generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.hex.encode(digest.bytes);
  }
}
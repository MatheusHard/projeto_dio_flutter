
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: '''CREATE TABLE tarefas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT,
        cloncluido INTEGER
  )'''
};
class DataBaseSqFlitte {

  static Database? db;

  Future<Database> obterDatabase() async {
    if(db == null){
      return await iniciarDatabase();
    }else{
      return db!;
    }
  }
  Future<Database> iniciarDatabase() async {

    var db = await openDatabase(
      path.join(await getDatabasesPath(),'database.db'),
      version: scripts.length,
      onCreate: (Database db, int version) async{
        for(var i = 1; i <= scripts.length; i++){
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
          for(var i =  oldVersion +1; i <= scripts.length; i++){
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
          }
    });
    return db;
  }
}
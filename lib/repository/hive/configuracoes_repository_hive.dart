import 'package:hive/hive.dart';
import 'package:projeto_dio_flutter/model/configuracoes_model.dart';

class ConfiguracoesRepositoryHive{

  static late Box _box;
  ConfiguracoesRepositoryHive._criar();

  static Future<ConfiguracoesRepositoryHive> carregar() async{
    if(Hive.isBoxOpen('configuracoes')){
      _box = Hive.box('configuracoes');
    }else{
      _box = await  Hive.openBox('configuracoes');
    }

    return ConfiguracoesRepositoryHive._criar();
  }

  void salvar(ConfiguracoesModel model){
    _box.put(
      'configuracoesModel',{
      'nomeUsuario': model.nomeUsuario,
      'altura': model.altura,
      'receberNOtificacoes': model.receberNOtificacoes,
      'temaEscuro':model.temaEscuro
    }
    );
  }
  ConfiguracoesModel getConfiguracoes(){
    var configuracoes = _box.get("configuracoesModel");
    if(configuracoes == null){
      return ConfiguracoesModel.vazio();
    }else{
      return ConfiguracoesModel(configuracoes["nomeUsuario"],
                                configuracoes["altura"],
                                configuracoes["receberNOtificacoes"],
                                configuracoes["temaEscuro"]);
    }
  }

}
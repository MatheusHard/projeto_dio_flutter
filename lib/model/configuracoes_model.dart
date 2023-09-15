class ConfiguracoesModel{
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNOtificacoes = false;
  bool _temaEscuro = false;

  ///COntrutor vazio:
  ConfiguracoesModel.vazio(){
    _nomeUsuario = "";
    _altura = 0;
    _receberNOtificacoes = false;
    _temaEscuro = false;
  }
  ///COntrutor preenchido
  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberNOtificacoes, this._temaEscuro);

  bool get temaEscuro => _temaEscuro;

  set temaEscuro(bool value) {
    _temaEscuro = value;
  }

  bool get receberNOtificacoes => _receberNOtificacoes;

  set receberNOtificacoes(bool value) {
    _receberNOtificacoes = value;
  }

  double get altura => _altura;

  set altura(double value) {
    _altura = value;
  }

  String get nomeUsuario => _nomeUsuario;

  set nomeUsuario(String value) {
    _nomeUsuario = value;
  }

//GETTERS AND SETTERS:


}
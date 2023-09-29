class TarefasBack4AppModel {
  List<TarefaBack4AppModel> tarefas= [];

  TarefasBack4AppModel(this.tarefas);

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <TarefaBack4AppModel>[];
      json['results'].forEach((v) {
        tarefas!.add(TarefaBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tarefas.map((v) => v.toJson()).toList();
    return data;
  }
}

class TarefaBack4AppModel {
  String objectId = "";
  String createdAt = "";
  String updatedAt = "";
  String descricao = "";
  bool concluida = false;

  TarefaBack4AppModel(
      this.objectId,
        this.createdAt,
        this.updatedAt,
        this.descricao,
        this.concluida);

  TarefaBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    descricao = json['descricao'];
    concluida = json['concluida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['descricao'] = this.descricao;
    data['concluida'] = this.concluida;
    return data;
  }
}
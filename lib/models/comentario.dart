import 'package:flutter/material.dart';

import 'gestor.dart';
import 'grupo.dart';
import 'liderado.dart';

class Comentario with ChangeNotifier {
  int id;
  Gestor gestor;
  Liderado liderado;
  String nomeGrupo;
  String assunto;
  String descricao;
  String dataAvaliacao;
  //double notaAvaliacao;

  Comentario({
    required this.id,
    required this.gestor,
    required this.liderado,
    required this.nomeGrupo,
    required this.assunto,
    required this.descricao,
    required this.dataAvaliacao,
    //required this.notaAvaliacao
  });
}

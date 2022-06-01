import 'package:evolution_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

import 'gestor.dart';
import 'liderado.dart';

class Grupo with ChangeNotifier {
  int idGrupo;
  Gestor gestor;
  List<Liderado> liderados;
  String nome;
  String descricao;

  Grupo(
      {required this.idGrupo,
      required this.gestor,
      required this.liderados,
      required this.nome,
      required this.descricao});

  void addLiderado(Liderado liderado) {
    this.liderados.add(liderado);
    notifyListeners();
  }

  void removeLiderado(Liderado liderado) {
    this.liderados.remove(liderado);
    notifyListeners();
  }
}

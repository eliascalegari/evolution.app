import 'dart:math';

import 'package:evolution_app/models/grupo.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class Grupos with ChangeNotifier {
  final List<Grupo> _items = dummyGrupos;

  List<Grupo> get items => [..._items];

  void saveGrupo(Map<String, Object> data) {
    bool hasId = data['idGrupo'] != null;

    final grupo = Grupo(
      idGrupo: hasId ? data['idGrupo'] as int : Random().nextInt(5000),
      gestor: dummyGestores[0],
      liderados: dummyLiderados,
      nome: data['nome'] as String,
      descricao: data['descricao'] as String,
    );

    if (hasId) {
      updateGrupo(grupo);
    } else {
      addGrupo(grupo);
    }
  }

  void addGrupo(Grupo grupo) {
    _items.add(grupo);
    notifyListeners();
  }

  void updateGrupo(Grupo grupo) {
    int index = _items.indexWhere((g) => g.idGrupo == grupo.idGrupo);
    if (index >= 0) {
      _items[index] = grupo;
      notifyListeners();
    }
  }

  void removeGrupo(Grupo grupo) {
    int index = _items.indexWhere((g) => g.idGrupo == grupo.idGrupo);
    if (index >= 0) {
      _items.removeWhere((g) => g.idGrupo == grupo.idGrupo);
      notifyListeners();
    }
  }
}

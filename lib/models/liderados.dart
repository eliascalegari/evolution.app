import 'dart:math';

import 'package:evolution_app/models/grupo.dart';
import 'package:evolution_app/models/liderado.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class Liderados with ChangeNotifier {
  final List<Liderado> _items = dummyLiderados;

  List<Liderado> get items => [..._items];

  void saveLiderado(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final liderado = Liderado(
      id: hasId ? data['id'] as int : Random().nextInt(10000),
      imagem: "images/perfil1.png",
      cargo: data['cargo'] as String,
      experiencia: data['experiencia'] as String,
      //indiceAvaliacao: data['indiceAvaliacao'] as double,
      //comentarios: [],
      nome: data['nome'] as String,
      sobrenome: data['sobrenome'] as String,
      email: data['email'] as String,
      senha: data['senha'] as String,
    );

    if (hasId) {
      updateLiderado(liderado);
    } else {
      addLiderado(liderado);
    }
  }

  void addLiderado(Liderado liderado) {
    _items.add(liderado);
    notifyListeners();
  }

  void updateLiderado(Liderado liderado) {
    int index = _items.indexWhere((g) => g.id == liderado.id);
    if (index >= 0) {
      _items[index] = liderado;
      notifyListeners();
    }
  }

  void removeLiderado(Liderado liderado) {
    int index = _items.indexWhere((g) => g.id == liderado.id);
    if (index >= 0) {
      _items.removeWhere((g) => g.id == liderado.id);
      notifyListeners();
    }
  }
}

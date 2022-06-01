import 'dart:math';

import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import 'gestor.dart';

class Gestores with ChangeNotifier {
  final List<Gestor> _items = dummyGestores;

  List<Gestor> get items => [..._items];

  void saveGestor(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final gestor = Gestor(
      id: hasId ? data['id'] as int : Random().nextInt(10000),
      imagem: "images/perfil1.png",
      cargo: data['cargo'] as String,
      experiencia: data['experiencia'] as String,
      nome: data['nome'] as String,
      sobrenome: data['sobrenome'] as String,
      email: data['email'] as String,
      senha: data['senha'] as String,
    );

    if (hasId) {
      updateGestor(gestor);
    } else {
      addGestor(gestor);
    }
  }

  void addGestor(Gestor gestor) {
    _items.add(gestor);
    notifyListeners();
  }

  void updateGestor(Gestor gestor) {
    int index = _items.indexWhere((g) => g.id == gestor.id);
    if (index >= 0) {
      _items[index] = gestor;
      notifyListeners();
    }
  }

  void removeGestor(Gestor gestor) {
    int index = _items.indexWhere((g) => g.id == gestor.id);
    if (index >= 0) {
      _items.removeWhere((g) => g.id == gestor.id);
      notifyListeners();
    }
  }

  bool authGestor(String email, String senha) {
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].email == email && _items[i].senha == senha) {
        return true;
      }
    }
    return false;
  }
}

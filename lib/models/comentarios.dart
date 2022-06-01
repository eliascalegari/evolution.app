import 'dart:math';

import 'package:evolution_app/models/comentario.dart';
import 'package:evolution_app/models/liderado.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class Comentarios with ChangeNotifier {
  final List<Comentario> _items = dummyComentarios;

  List<Comentario> get items => [..._items];

  void saveComentario(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final comentario = Comentario(
      id: hasId ? data['id'] as int : Random().nextInt(10000),
      gestor: dummyGestores[0],
      liderado: dummyLiderados[0],
      nomeGrupo: dummyGrupos[0].nome,
      assunto: data['assunto'] as String,
      descricao: data['descricao'] as String,
      dataAvaliacao: '01/06/2022',
      //dataAvaliacao: data['dataAvaliacao'] as String,
      //notaAvaliacao: data['notaAvaliacao'] as double,
    );
    if (hasId) {
      updateComentario(comentario);
    } else {
      addComentario(comentario);
    }
  }

  void addComentario(Comentario comentario) {
    _items.add(comentario);
    notifyListeners();
  }

  void updateComentario(Comentario comentario) {
    int index = _items.indexWhere((g) => g.id == comentario.id);
    if (index >= 0) {
      _items[index] = comentario;
      notifyListeners();
    }
  }

  void removeComentario(Comentario comentario) {
    int index = _items.indexWhere((g) => g.id == comentario.id);
    if (index >= 0) {
      _items.removeWhere((g) => g.id == comentario.id);
      notifyListeners();
    }
  }
}

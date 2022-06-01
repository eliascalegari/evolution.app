import 'package:evolution_app/models/comentario.dart';
import 'package:flutter/material.dart';

import 'usuario.dart';

class Gestor extends Usuario with ChangeNotifier {
  String imagem;
  String cargo;
  String experiencia;

  Gestor(
      {required this.imagem,
      required this.cargo,
      required this.experiencia,
      required int id,
      required String nome,
      required String sobrenome,
      required String email,
      required String senha})
      : super(
            id: id,
            nome: nome,
            sobrenome: sobrenome,
            email: email,
            senha: senha);
}

import 'package:evolution_app/models/comentario.dart';
import 'package:flutter/material.dart';

import 'usuario.dart';

class Liderado extends Usuario with ChangeNotifier {
  String imagem;
  String cargo;
  String experiencia;
  double? indiceAvaliacao;
  List<Comentario>? comentarios;

  Liderado({
    required this.imagem,
    required this.cargo,
    required this.experiencia,
    required int id,
    required String nome,
    required String sobrenome,
    required String email,
    required String senha,
  }) : super(
            id: id,
            nome: nome,
            sobrenome: sobrenome,
            email: email,
            senha: senha);

  @override
  String toString() {
    return 'Liderado{id: $id, nome: $nome, sobrenome: $sobrenome, email: $email, cargo: $cargo, experiência: $experiencia}';
  }
}

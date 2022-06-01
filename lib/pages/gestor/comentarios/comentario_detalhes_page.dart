import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/comentario.dart';

class ComentarioDetalhesPage extends StatelessWidget {
  const ComentarioDetalhesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Comentario comentario =
        ModalRoute.of(context)!.settings.arguments as Comentario;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Feedback"),
      ),
      body: Column(
        children: [
          Text(
            'Assunto: ' + comentario.assunto,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Text(
            'Gestor: ' +
                comentario.gestor.nome +
                ' ' +
                comentario.gestor.sobrenome,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            'Data: ' + comentario.dataAvaliacao,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            'Descrição: ' + comentario.descricao,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

import 'package:evolution_app/models/liderado.dart';
import 'package:evolution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/comentario.dart';

class ComentariosListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comentario = Provider.of<Comentario>(context, listen: false);
    return Material(
      child: ListTile(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: Text(
          comentario.assunto,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          comentario.gestor.nome + ' ' + comentario.gestor.sobrenome,
          style: TextStyle(fontSize: 16),
        ),
        //trailing: Text(comentario.notaAvaliacao.toString()),
        selected: false,
        selectedTileColor: Colors.indigo[50],
        onTap: () => {
          Navigator.of(context).pushNamed(
            AppRoutes.COMENTARIO_DETALHES,
            arguments: comentario,
          )
        },
      ),
    );
  }
}

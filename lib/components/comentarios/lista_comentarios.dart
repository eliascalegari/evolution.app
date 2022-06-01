import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/comentario.dart';
import '../../models/comentarios.dart';

import 'comentarios_list_item.dart';

class ListaComentarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Comentarios>(context);
    final List<Comentario> comentarios = provider.items;
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: comentarios.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: comentarios[i],
        child: ComentariosListItem(),
      ),
      scrollDirection: Axis.vertical,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/grupo.dart';
import '../../models/grupos.dart';
import 'grupos_list_item.dart';

class ListaGrupos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Grupos>(context);
    final List<Grupo> grupos = provider.items;
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: grupos.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: grupos[i],
        child: GruposListItem(),
      ),
      scrollDirection: Axis.vertical,
    );
  }
}

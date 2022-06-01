import 'package:evolution_app/models/grupo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/liderados/liderados_list_item.dart';

class GrupoDetalhesPage extends StatelessWidget {
  const GrupoDetalhesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Grupo grupo = ModalRoute.of(context)!.settings.arguments as Grupo;
    final liderados = grupo.liderados;

    return Scaffold(
      appBar: AppBar(
        title: Text(grupo.nome),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: liderados.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: liderados[i],
          child: LideradosListItem(),
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

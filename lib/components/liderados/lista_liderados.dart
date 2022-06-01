import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/liderado.dart';
import '../../models/liderados.dart';
import 'liderados_list_item.dart';

class ListaLiderados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Liderados>(context);
    final List<Liderado> liderados = provider.items;
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: liderados.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: liderados[i],
        child: LideradosListItem(),
      ),
      scrollDirection: Axis.vertical,
    );
  }
}

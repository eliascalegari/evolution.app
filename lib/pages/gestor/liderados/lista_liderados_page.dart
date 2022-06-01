import 'package:flutter/material.dart';

import '../../../components/liderados/lista_liderados.dart';

class ListaLideradosPage extends StatefulWidget {
  ListaLideradosPage({Key? key}) : super(key: key);

  @override
  State<ListaLideradosPage> createState() => _ListaLideradosPageState();
}

class _ListaLideradosPageState extends State<ListaLideradosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Lista de Liderados'),
        ),
      ),
      body: ListaLiderados(),
    );
  }
}

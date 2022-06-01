import 'package:evolution_app/models/liderado.dart';
import 'package:flutter/material.dart';

import '../../../components/comentarios/lista_comentarios.dart';

class ListaComentariosPage extends StatefulWidget {
  ListaComentariosPage({Key? key}) : super(key: key);

  @override
  State<ListaComentariosPage> createState() => _ListaComentariosPageState();
}

class _ListaComentariosPageState extends State<ListaComentariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lista de Feedbacks')),
      ),
      body: ListaComentarios(),
    );
  }
}

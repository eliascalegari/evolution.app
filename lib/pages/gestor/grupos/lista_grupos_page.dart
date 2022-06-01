import 'package:evolution_app/pages/gestor/grupos/grupo_form_page.dart';
import 'package:flutter/material.dart';

import '../../../components/grupos/lista_grupos.dart';

class ListaGruposPage extends StatefulWidget {
  ListaGruposPage({Key? key}) : super(key: key);

  @override
  State<ListaGruposPage> createState() => _ListaGruposPageState();
}

class _ListaGruposPageState extends State<ListaGruposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Lista de Grupos'),
        ),
      ),
      body: ListaGrupos(),
    );
  }
}

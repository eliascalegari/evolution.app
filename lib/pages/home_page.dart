import 'package:evolution_app/models/liderado.dart';
import 'package:evolution_app/models/liderados.dart';
import 'package:evolution_app/pages/gestor/grupos/lista_grupos_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';
import '../utils/app_routes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Grupos'),
      ),
      body: ListaGruposPage(),
      drawer: AppDrawer(),
    );
  }
}

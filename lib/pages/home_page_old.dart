import 'package:evolution_app/pages/cadastro_form_page.dart';
import 'package:evolution_app/pages/gestor/comentarios/lista_comentarios_page.dart';
import 'package:evolution_app/pages/gestor/grupos/grupo_form_page.dart';
import 'package:evolution_app/pages/gestor/liderados/liderado_form_page.dart';
import 'package:flutter/material.dart';

import 'gestor/comentarios/comentario_form_page.dart';
import 'gestor/grupos/lista_grupos_page.dart';
import 'gestor/liderados/lista_liderados_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: pc,
        children: [
          ListaGruposPage(),
          ListaLideradosPage(),
          ListaComentariosPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Grupos',
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Liderados'),
          BottomNavigationBarItem(
              icon: Icon(Icons.feedback), label: 'Comentários'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
        backgroundColor: Colors.black87,
      ),
    );
  }
}

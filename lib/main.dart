import 'package:evolution_app/pages/cadastro_form_page.dart';
import 'package:evolution_app/pages/gestor/comentarios/comentario_detalhes_page.dart';
import 'package:evolution_app/pages/gestor/comentarios/lista_comentarios_page.dart';
import 'package:evolution_app/pages/gestor/grupos/grupo_form_page.dart';
import 'package:evolution_app/pages/gestor/grupos/lista_grupos_page.dart';
import 'package:evolution_app/pages/gestor/liderados/liderado_form_page.dart';
import 'package:evolution_app/pages/gestor/liderados/lista_liderados_page.dart';
import 'package:evolution_app/pages/home_page_old.dart';
import 'package:evolution_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/comentarios.dart';
import 'models/gestores.dart';
import 'models/grupos.dart';
import 'models/liderados.dart';
import 'pages/gestor/comentarios/comentario_form_page.dart';
import 'pages/gestor/grupos/grupo_detalhes_page.dart';
import 'pages/gestor/liderados/liderado_detalhes_page.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Liderados(),
        ),
        ChangeNotifierProvider(
          create: (_) => Grupos(),
        ),
        ChangeNotifierProvider(
          create: (_) => Comentarios(),
        ),
        ChangeNotifierProvider(
          create: (_) => Gestores(),
        ),
      ],
      child: MaterialApp(
        title: 'Evolution',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Lato',
        ),
        home: LoginPage(),
        routes: {
          AppRoutes.LIDERADO_DETALHES: (ctx) => LideradoDetalhesPage(),
          AppRoutes.LISTA_LIDERADOS: (ctx) => ListaLideradosPage(),
          AppRoutes.LIDERADO_FORM: (ctx) => LideradoFormPage(),
          AppRoutes.GRUPO_DETALHES: (ctx) => GrupoDetalhesPage(),
          AppRoutes.GRUPO_FORM: (ctx) => GrupoFormPage(),
          AppRoutes.LISTA_GRUPOS: (ctx) => ListaGruposPage(),
          AppRoutes.COMENTARIO_DETALHES: (ctx) => ComentarioDetalhesPage(),
          AppRoutes.LISTA_COMENTARIOS: (ctx) => ListaComentariosPage(),
          AppRoutes.COMENTARIO_FORM: (ctx) => ComentarioFormPage(),
          AppRoutes.HOME_PAGE: (ctx) => HomePage(),
          AppRoutes.CADASTRO_FORM: (ctx) => CadastroFormPage(),
          AppRoutes.LOGIN_PAGE: (ctx) => LoginPage(),

          //AppRoutes.GESTOR_DETALHES: (ctx) => GestorDetalhesPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

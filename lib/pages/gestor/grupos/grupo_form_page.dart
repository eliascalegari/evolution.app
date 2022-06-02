import 'dart:math';

import 'package:evolution_app/data/dummy_data.dart';
import 'package:evolution_app/models/grupo.dart';
import 'package:evolution_app/models/grupos.dart';
import 'package:evolution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home_page_old.dart';

class GrupoFormPage extends StatefulWidget {
  const GrupoFormPage({Key? key}) : super(key: key);

  @override
  State<GrupoFormPage> createState() => _GrupoFormPageState();
}

class _GrupoFormPageState extends State<GrupoFormPage> {
  final _nomeFocus = FocusNode();
  final _descricaoFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final grupo = arg as Grupo;
        _formData['idGrupo'] = grupo.idGrupo;
        _formData['gestor'] = grupo.gestor;
        //_formData['liderados'] = grupo.liderados;
        _formData['nome'] = grupo.nome;
        _formData['descricao'] = grupo.descricao;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nomeFocus.dispose();
    _descricaoFocus.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<Grupos>(
      context,
      listen: false,
    ).saveGrupo(_formData);
    //Navigator.of(context).popAndPushNamed(AppRoutes.HOME_PAGE);
    Navigator.of(context).popAndPushNamed(AppRoutes.HOME_PAGE);
  }

  static const String _title = 'Evolution.org';
  static const colorText = Color.fromARGB(255, 100, 100, 100);

  var firstText = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 24.0,
        color: colorText,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Crie um '),
        TextSpan(text: 'grupo ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: 'do seu time'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(0, 135, 152, 214),
            elevation: 0,
            centerTitle: false,
            toolbarHeight: 100,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xff8798D6)),
                onPressed: () {
                  Navigator.pop(context, true);
                })),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: firstText),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: _formData['nome']?.toString(),
                    decoration: InputDecoration(labelText: 'Nome do Grupo: '),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_descricaoFocus);
                    },
                    onSaved: (nome) => _formData['nome'] = nome ?? '',
                    validator: (_nome) {
                      final nome = _nome ?? '';
                      if (nome.trim().isEmpty) {
                        return 'Informe o nome do grupo.';
                      }

                      if (nome.trim().length < 3) {
                        return 'O nome deve conter no mínimo 3 caracteres.';
                      }

                      if (nome.trim().length > 20) {
                        return 'O nome pode conter no máximo 20 caracteres.';
                      }

                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    maxLines: null,
                    initialValue: _formData['descricao']?.toString(),
                    decoration: InputDecoration(
                      labelText: 'Descrição: ',
                    ),
                    textInputAction: TextInputAction.go,
                    focusNode: _descricaoFocus,
                    onFieldSubmitted: (_) => null,
                    onSaved: (descricao) =>
                        _formData['descricao'] = descricao ?? '',
                    validator: (_descricao) {
                      final descricao = _descricao ?? '';
                      if (descricao.trim().isEmpty) {
                        return 'Informe a descrição do grupo.';
                      }

                      if (descricao.trim().length < 20) {
                        return 'A descrição deve conter no mínimo 20 caracteres.';
                      }

                      if (descricao.trim().length > 300) {
                        return 'O nome pode conter no máximo 300 caracteres.';
                      }

                      return null;
                    },
                  ),
                ),
                Container(
                  height: 70,
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff8798D6)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    child: const Text(
                      'Adicionar Grupo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: _submitForm,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

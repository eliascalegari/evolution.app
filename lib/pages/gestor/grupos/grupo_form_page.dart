import 'dart:math';

import 'package:evolution_app/data/dummy_data.dart';
import 'package:evolution_app/models/grupo.dart';
import 'package:evolution_app/models/grupos.dart';
import 'package:evolution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    Navigator.of(context).popAndPushNamed(AppRoutes.HOME_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Criando um Grupo'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
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
              TextFormField(
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
              TextButton.icon(
                onPressed: _submitForm,
                icon: Icon(Icons.save),
                label: Text(
                  'Salvar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

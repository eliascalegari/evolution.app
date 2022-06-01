import 'dart:math';

import 'package:evolution_app/models/comentario.dart';
import 'package:evolution_app/models/comentarios.dart';
import 'package:evolution_app/models/grupo.dart';
import 'package:evolution_app/models/grupos.dart';
import 'package:evolution_app/pages/home_page.dart';
import 'package:evolution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComentarioFormPage extends StatefulWidget {
  const ComentarioFormPage({Key? key}) : super(key: key);

  @override
  State<ComentarioFormPage> createState() => _ComentarioFormPageState();
}

class _ComentarioFormPageState extends State<ComentarioFormPage> {
  final _assuntoFocus = FocusNode();
  final _descricaoFocus = FocusNode();
  final _dataAvaliacaoFocus = FocusNode();
  final _notaAvaliacaoFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final comentario = arg as Comentario;
        _formData['assunto'] = comentario.assunto;
        _formData['descricao'] = comentario.descricao;
        //_formData['notaAvaliacao'] = comentario.notaAvaliacao.toDouble();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _assuntoFocus.dispose();
    _descricaoFocus.dispose();
    _notaAvaliacaoFocus.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<Comentarios>(
      context,
      listen: false,
    ).saveComentario(_formData);
    Navigator.of(context).popAndPushNamed(AppRoutes.HOME_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Feedback'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formData['assunto']?.toString(),
                decoration: InputDecoration(labelText: 'Assunto: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descricaoFocus);
                },
                onSaved: (assunto) => _formData['assunto'] = assunto ?? '',
                maxLength: 20,
                validator: (_assunto) {
                  final assunto = _assunto ?? '';
                  if (assunto.trim().isEmpty) {
                    return 'Informe o assunto.';
                  }

                  if (assunto.trim().length < 5) {
                    return 'O assunto deve conter no mínimo 5 caracteres.';
                  }

                  if (assunto.trim().length > 20) {
                    return 'O assunto pode conter no máximo 20 caracteres.';
                  }

                  return null;
                },
              ),
              TextFormField(
                maxLines: null,
                initialValue: _formData['descricao']?.toString(),
                decoration: InputDecoration(
                  labelText: 'Comentário: ',
                ),
                textInputAction: TextInputAction.go,
                focusNode: _descricaoFocus,
                onFieldSubmitted: (_) => null,
                onSaved: (descricao) =>
                    _formData['descricao'] = descricao ?? '',
                maxLength: 300,
                validator: (_descricao) {
                  final descricao = _descricao ?? '';
                  if (descricao.trim().isEmpty) {
                    return 'Insira o comentário.';
                  }

                  if (descricao.trim().length < 50) {
                    return 'O comentário deve conter no mínimo 50 caracteres.';
                  }

                  if (descricao.trim().length > 300) {
                    return 'O comentário pode conter no máximo 300 caracteres.';
                  }

                  return null;
                },
              ),
              /*TextFormField(
                initialValue: _formData['notaAvaliacao']?.toString(),
                decoration: InputDecoration(labelText: 'notaAvaliacao'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => 5,
                onSaved: (notaAvaliacao) =>
                    _formData['notaAvaliacao'] = notaAvaliacao ?? '',
                maxLength: 3,
                validator: (_notaAvaliacao) {
                  final notaAvaliacao = _notaAvaliacao ?? '';
                  if (notaAvaliacao.trim().isEmpty) {
                    return 'Informe a nota.';
                  }

                  return null;
                },
              ),*/
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

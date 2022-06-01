import 'dart:math';

import 'package:evolution_app/data/dummy_data.dart';
import 'package:evolution_app/models/gestores.dart';
import 'package:evolution_app/models/grupo.dart';
import 'package:evolution_app/models/grupos.dart';
import 'package:evolution_app/models/liderado.dart';
import 'package:evolution_app/models/liderados.dart';
import 'package:evolution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _nomeFocus = FocusNode();
  final _sobrenomeFocus = FocusNode();
  final _cargoFocus = FocusNode();
  final _experienciaFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _senhaFocus = FocusNode();
  final _tipoUsuario = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void dispose() {
    super.dispose();
    _nomeFocus.dispose();
    _sobrenomeFocus.dispose();
    _cargoFocus.dispose();
    _experienciaFocus.dispose();
    _emailFocus.dispose();
    _senhaFocus.dispose();
    _tipoUsuario.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    final validador = Provider.of<Gestores>(context, listen: false);

    if (validador.authGestor(
      _formData['email'].toString(),
      _formData['senha'].toString(),
    )) {
      Navigator.of(context).popAndPushNamed(AppRoutes.HOME_PAGE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formData['email']?.toString(),
                decoration: InputDecoration(labelText: 'Email: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_senhaFocus);
                },
                onSaved: (email) => _formData['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.trim().isEmpty) {
                    return 'Informe o email do liderado.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['senha']?.toString(),
                decoration: InputDecoration(labelText: 'Senha: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_cargoFocus);
                },
                onSaved: (senha) => _formData['senha'] = senha ?? '',
                validator: (_senha) {
                  final senha = _senha ?? '';
                  if (senha.trim().isEmpty) {
                    return 'Informe a senha do liderado.';
                  }

                  return null;
                },
              ),
              TextButton.icon(
                onPressed: _submitForm,
                icon: Icon(Icons.send_to_mobile),
                label: Text(
                  'Salvar',
                ),
              ),
              TextButton.icon(
                onPressed: () => Navigator.of(context)
                    .popAndPushNamed(AppRoutes.CADASTRO_FORM),
                icon: Icon(Icons.send),
                label: Text(
                  'Cadastrar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

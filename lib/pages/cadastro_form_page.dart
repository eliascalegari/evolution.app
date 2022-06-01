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

class CadastroFormPage extends StatefulWidget {
  const CadastroFormPage({Key? key}) : super(key: key);

  @override
  State<CadastroFormPage> createState() => _CadastroFormPage();
}

class _CadastroFormPage extends State<CadastroFormPage> {
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

    String tipoUser = _formData['tipoUsuario'].toString();

    print(tipoUser);

    if (tipoUser == 'Gestor') {
      Provider.of<Gestores>(
        context,
        listen: false,
      ).saveGestor(_formData);
      Navigator.of(context).popAndPushNamed(AppRoutes.LOGIN_PAGE);
    } else if (tipoUser == 'Liderado') {
      Provider.of<Liderados>(
        context,
        listen: false,
      ).saveLiderado(_formData);
      Navigator.of(context).popAndPushNamed(AppRoutes.LOGIN_PAGE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Cadastro de Usuario'),
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
                decoration: InputDecoration(labelText: 'Nome: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_sobrenomeFocus);
                },
                onSaved: (nome) => _formData['nome'] = nome ?? '',
                validator: (_nome) {
                  final nome = _nome ?? '';
                  if (nome.trim().isEmpty) {
                    return 'Informe o nome do liderado.';
                  }

                  if (nome.trim().length < 3) {
                    return 'O nome deve conter no mínimo 3 caracteres.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['sobrenome']?.toString(),
                decoration: InputDecoration(labelText: 'Sobrenome: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_cargoFocus);
                },
                onSaved: (sobrenome) =>
                    _formData['sobrenome'] = sobrenome ?? '',
                validator: (_sobrenome) {
                  final sobrenome = _sobrenome ?? '';
                  if (sobrenome.trim().isEmpty) {
                    return 'Informe o sobrenome do liderado.';
                  }

                  if (sobrenome.trim().length < 3) {
                    return 'O sobrenome deve conter no mínimo 3 caracteres.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['cargo']?.toString(),
                decoration: InputDecoration(labelText: 'Cargo: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_experienciaFocus);
                },
                onSaved: (cargo) => _formData['cargo'] = cargo ?? '',
                validator: (_cargo) {
                  final cargo = _cargo ?? '';
                  if (cargo.trim().isEmpty) {
                    return 'Informe o cargo do liderado.';
                  }

                  if (cargo.trim().length < 5) {
                    return 'O cargo deve conter no mínimo 5 caracteres.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['experiencia']?.toString(),
                decoration: InputDecoration(labelText: 'Experiência: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocus);
                },
                onSaved: (experiencia) =>
                    _formData['experiencia'] = experiencia ?? '',
                validator: (_experiencia) {
                  final experiencia = _experiencia ?? '';
                  if (experiencia.trim().isEmpty) {
                    return 'Informe o nivel de experiência no cargo.';
                  }

                  return null;
                },
              ),
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
                    return 'Informe o endereço de email.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['senha']?.toString(),
                decoration: InputDecoration(labelText: 'Senha: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).nextFocus();
                },
                onSaved: (senha) => _formData['senha'] = senha ?? '',
                validator: (_senha) {
                  final senha = _senha ?? '';
                  if (senha.trim().isEmpty) {
                    return 'Informe a senha.';
                  }

                  if (senha.trim().length < 15) {
                    return 'A senha deve conter no mínimo 15 caracteres.';
                  }

                  if (senha.trim().length > 20) {
                    return 'A senha pode conter no máximo 20 caracteres.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['tipoUsuario']?.toString(),
                decoration: InputDecoration(labelText: 'Tipo: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).nextFocus();
                },
                onSaved: (tipoUsuario) =>
                    _formData['tipoUsuario'] = tipoUsuario ?? '',
                validator: (_tipoUsuario) {
                  final tipoUsuario = _tipoUsuario ?? '';
                  if (tipoUsuario.trim().isEmpty) {
                    return 'Informe o tipo.';
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

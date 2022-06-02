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

  static const String _title = 'Evolution.org';

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _emailFocus = FocusNode();
  final _senhaFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  static const colorText = Color.fromARGB(255, 100, 100, 100);

  @override
  void dispose() {
    super.dispose();

    _emailFocus.dispose();
    _senhaFocus.dispose();
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

  var textCad = RichText(
    text: const TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: TextStyle(
        fontSize: 22.0,
        color: colorText,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Sou '),
        TextSpan(
            text: 'gestor ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: 'e '),
        TextSpan(
            text: 'não tenho conta ',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );

  var textLogin = RichText(
    text: const TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: TextStyle(
        fontSize: 22.0,
        color: colorText,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Já '),
        TextSpan(
            text: 'tenho conta ', style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
  );

  var textEnter = RichText(
    text: const TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: TextStyle(
        fontSize: 28.0,
        color: colorText,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Olá, seja bem vindx ao '),
        TextSpan(
            text: 'Evolution.org! ',
            style: TextStyle(
                color: Color(0xffffd1c7), fontWeight: FontWeight.bold))
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: textEnter,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 0),
                child: textLogin,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
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
                      return 'Informe o email';
                    }

                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  initialValue: _formData['senha']?.toString(),
                  decoration: InputDecoration(labelText: 'Senha: '),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus;
                  },
                  onSaved: (senha) => _formData['senha'] = senha ?? '',
                  validator: (_senha) {
                    final senha = _senha ?? '';
                    if (senha.trim().isEmpty) {
                      return 'Informe a senha';
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
                      'Entrar',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: _submitForm,
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 0),
                  child: textCad),
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
                      'Cadastrar',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Navigator.of(context)
                        .popAndPushNamed(AppRoutes.CADASTRO_FORM),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

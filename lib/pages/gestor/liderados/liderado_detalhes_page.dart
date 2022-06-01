import 'package:flutter/material.dart';

import '../../../../models/liderado.dart';

class LideradoDetalhesPage extends StatelessWidget {
  const LideradoDetalhesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Liderado liderado =
        ModalRoute.of(context)!.settings.arguments as Liderado;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Liderado"),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Image.asset(liderado.imagem),
            Center(
              child: Text(
                liderado.nome + " " + liderado.sobrenome,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            Text(
              liderado.cargo + " - " + liderado.experiencia,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              liderado.email,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Código: ${liderado.id.toString()}',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}

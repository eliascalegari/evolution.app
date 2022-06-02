import 'package:evolution_app/pages/gestor/grupos/grupo_form_page.dart';
import 'package:evolution_app/pages/home_page_old.dart';
import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

void main() => runApp(const CreateGroupPage());

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  static const String _title = 'Evolution.org';

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  static const colorText = Color.fromARGB(255, 100, 100, 100);
  var firstText = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 24.0,
        color: colorText,
      ),
      children: <TextSpan>[
        TextSpan(
            text: 'Configure ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: 'seu grupo '),
      ],
    ),
  );
  var longText = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 18,
        color: colorText,
      ),
      children: <TextSpan>[
        TextSpan(
            text:
                "Aqui você colocará as pessoas que fazem parte do seu time, os seus liderados.",
            style: TextStyle(height: 1.5))
      ],
    ),
  );
  var longTextPartTwo = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 18,
        color: colorText,
      ),
      children: <TextSpan>[
        TextSpan(
            text: "Cada pessoa só pode ser adicionada à um único grupo. ",
            style: TextStyle(height: 1.5))
      ],
    ),
  );
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CreateGroupPage._title,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(0, 135, 152, 214),
            elevation: 0,
            centerTitle: false,
            toolbarHeight: 100,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xff8798D6)),
                onPressed: () {
                  Navigator.of(context).pop();
                })),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            // child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
                    child: firstText),
                Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: longText),
                Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: longTextPartTwo),
                Container(
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff8798D6)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      child: const Text(
                        'Configurar agora',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .popAndPushNamed(AppRoutes.GRUPO_FORM);
                      },
                    )),
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .popAndPushNamed(AppRoutes.HOME_PAGE);
                        },
                        child: const Text('Configurar depois'),
                      ),
                    )),
              ],
            )
            // )
            ),
      ),
    );
  }
}

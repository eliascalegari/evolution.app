import 'package:evolution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(''),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_rounded),
            title: Text('Liderados'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.LISTA_LIDERADOS,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.group_rounded),
            title: Text('Grupos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.LISTA_GRUPOS,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.feedback_rounded),
            title: Text('Feedbacks'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.LISTA_COMENTARIOS,
              );
            },
          ),
        ],
      ),
    );
  }
}

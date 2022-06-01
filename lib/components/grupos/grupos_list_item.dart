import 'package:evolution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/grupo.dart';
import '../../models/grupos.dart';

class GruposListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final grupo = Provider.of<Grupo>(context, listen: false);
    return Material(
      child: ListTile(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: Text(
          grupo.nome,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        subtitle:
            Text("Gestor: ${grupo.gestor.nome} ${grupo.gestor.sobrenome}"),
        trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () => {
                          Navigator.of(context).pushNamed(
                            AppRoutes.GRUPO_FORM,
                            arguments: grupo,
                          ),
                        },
                    icon: const Icon(Icons.edit),
                    color: Colors.black87),
                IconButton(
                    onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Grupo'),
                              content: Text(
                                  '${grupo.gestor.nome}, você tem certeza que deseja excluir o grupo ${grupo.nome}'),
                              actions: [
                                TextButton(
                                  child: Text('Não'),
                                  onPressed: () => Navigator.of(ctx).pop(),
                                ),
                                TextButton(
                                    child: Text('Sim'),
                                    onPressed: () {
                                      Provider.of<Grupos>(
                                        context,
                                        listen: false,
                                      ).removeGrupo(grupo);
                                      Navigator.of(ctx).pop();
                                    }),
                              ],
                            ),
                          ),
                        },
                    icon: const Icon(Icons.delete),
                    color: Colors.black87),
              ],
            )),
        selected: false,
        selectedTileColor: Colors.indigo[50],
        onTap: () => {
          Navigator.of(context).pushNamed(
            AppRoutes.GRUPO_DETALHES,
            arguments: grupo,
          )
        },
      ),
    );
  }
}

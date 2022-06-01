import 'package:evolution_app/models/liderado.dart';
import 'package:evolution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/liderados.dart';

class LideradosListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final liderado = Provider.of<Liderado>(context, listen: false);
    return Material(
      child: ListTile(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        leading: SizedBox(
          child: Image.asset(liderado.imagem),
          width: 50,
        ),
        title: Text(
          liderado.nome + " " + liderado.sobrenome,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(liderado.cargo + " - " + liderado.experiencia),
        trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () => {
                          Navigator.of(context).pushNamed(
                            AppRoutes.LIDERADO_FORM,
                            arguments: liderado,
                          ),
                        },
                    icon: const Icon(Icons.edit),
                    color: Colors.black87),
                IconButton(
                    onPressed: () => {
                          Navigator.of(context).pushNamed(
                            AppRoutes.LISTA_COMENTARIOS,
                            arguments: liderado,
                          ),
                        },
                    icon: const Icon(Icons.feedback),
                    color: Colors.black87),
                /*IconButton(
                    onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Liderado'),
                              content: Text(
                                  'Você tem certeza que deseja excluir o liderado ${liderado.nome}'),
                              actions: [
                                TextButton(
                                  child: Text('Não'),
                                  onPressed: () => Navigator.of(ctx).pop(),
                                ),
                                TextButton(
                                    child: Text('Sim'),
                                    onPressed: () {
                                      Provider.of<Liderados>(
                                        context,
                                        listen: false,
                                      ).removeLiderado(liderado);
                                      Navigator.of(ctx).pop();
                                    }),
                              ],
                            ),
                          ),
                        },
                    icon: const Icon(Icons.delete),
                    color: Colors.black87),*/
              ],
            )),
        selected: false,
        selectedTileColor: Colors.indigo[50],
        onTap: () => {
          Navigator.of(context).pushNamed(
            AppRoutes.LIDERADO_DETALHES,
            arguments: liderado,
          )
        },
      ),
    );
  }
}

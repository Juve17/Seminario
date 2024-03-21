import 'package:delivery_1/src/db/db.dart';
import 'package:flutter/material.dart';

class ListaUser extends StatelessWidget {
  const ListaUser({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: DBProvider.db.getTodosUsuarios(),
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final usuariosf = snapshot.data;

        if (usuariosf!.isEmpty) {
          return const Center(
            child: Text('No hay registros'),
          );
        }

        return ListView.builder(
          itemCount: usuariosf.length,
          itemBuilder: (context, index) =>  ListTile(
            leading: const Icon(Icons.supervised_user_circle_rounded),
            title: Text(usuariosf[index].nombre),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        );
      },
    );
  }
}

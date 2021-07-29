import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex_flutt/src/models/usuarios.dart';
import 'package:provider_ex_flutt/src/providers/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                usuarioService.borrarUsuario();
              },
              icon: Icon(Icons.delete))
        ],
        title: Text('Home Page'),
      ),
      body: (usuarioService.existeUsuario)
          ? Profesiones(usuario: usuarioService.usuario)
          : Center(child: Text('No hay datos')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.public_sharp),
        onPressed: () {
          Navigator.pushNamed(context, 'second');
        },
      ),
    );
  }
}

class Profesiones extends StatelessWidget {
  final Usuario usuario;

  const Profesiones({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profesiones
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider_ex_flutt/src/models/usuarios.dart';

class UserProvider extends ChangeNotifier {
  Usuario _usuario = new Usuario(edad: 0, nombre: '', profesiones: []);

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (_usuario.edad == 0) ? false : true;

  void cargarUsuario(Usuario user) {
    _usuario.edad = user.edad;
    _usuario.nombre = user.nombre;
    _usuario.profesiones = user.profesiones.toList();

    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void borrarUsuario() {
    _usuario.edad = 0;
    notifyListeners();
  }

  void agregarProfesion(String profesion) {
    _usuario.profesiones.add(profesion);
    notifyListeners();
  }
}

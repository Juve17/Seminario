 
import 'package:delivery_1/src/pages/iniciar_session.dart';
import 'package:delivery_1/src/pages/inicio.dart';
import 'package:delivery_1/src/pages/registrarse.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> rutas = {
  'Inicio': (context) => const Inicio(),
  'Registrarse': (context) => const Registrarse(),
  'IniciarSession': (context) => const IniciarSession(),
};

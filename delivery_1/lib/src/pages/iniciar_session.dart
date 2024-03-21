import 'package:delivery_1/src/db/db.dart';
import 'package:delivery_1/src/routes/constantes.dart';
import 'package:delivery_1/src/widgets/h1_.dart';
import 'package:delivery_1/src/widgets/headlibre_.dart';
import 'package:delivery_1/src/widgets/input.dart';
import 'package:delivery_1/src/widgets/lista_user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IniciarSession extends StatefulWidget {
  const IniciarSession({super.key});

  @override
  State<IniciarSession> createState() => _IniciarSessionState();
}

class _IniciarSessionState extends State<IniciarSession> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  String _mensaje = '';
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double alto = screensize.height;
    double ancho = screensize.width;

    return Scaffold(
      backgroundColor: kfondo,
      appBar: headLibre_(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: alto - 150,
              width: ancho - 10,
              margin: const EdgeInsets.only(right: 40, left: 40, bottom: 90),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  h1_(value: 'Bienvenido'),
                  input_(
                      label: 'Nombres',
                      type: 'text',
                      controller: _nombreController),
                  input_(
                      label: 'Apellidos',
                      placeholder_: 'Apellidos',
                      controller: _apellidosController),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 30),
                      decoration: BoxDecoration(
                        color: kprimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _agregar();
                        },
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    _mensaje,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  const ListaUser(),
                ],
              ),
            ),
            Positioned(
              top: alto - 220,
              left: 40,
              child: SizedBox(
                height: 150,
                child: Image.asset(
                  'assets/image/inicio2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _agregar() {
    String nombre = _nombreController.text;
    String apellidos = _apellidosController.text;

    if (nombre.isNotEmpty && apellidos.isNotEmpty) {
      final usuarios = UserModel(id: 2, nombre: nombre, apellidos: apellidos);
      DBProvider.db.nuevoUsuario(usuarios);
      if (kDebugMode) {
        print('Uuvenal');
      }
      setState(() {
        _mensaje = 'Envio';
      });
    } else {
      if (kDebugMode) {
        print('Uuvenasssssl');
      }
      setState(() {
        _mensaje = 'Completar la inforacion';
      });
    }
  }
}

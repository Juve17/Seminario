import 'package:delivery_1/src/routes/constantes.dart';
import 'package:delivery_1/src/widgets/h1_.dart';
import 'package:delivery_1/src/widgets/headlibre_.dart';
import 'package:delivery_1/src/widgets/input.dart';
import 'package:flutter/material.dart';

class IniciarSession extends StatefulWidget {
  const IniciarSession({super.key});

  @override
  State<IniciarSession> createState() => _IniciarSessionState();
}

class _IniciarSessionState extends State<IniciarSession> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
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
                      label: 'Usuario',
                      type: 'text',
                      controller: _usuarioController),
                  input_(
                      label: 'Contraseña',
                      placeholder_: 'Contraseña',
                      type: 'password',
                      controller: _contrasenaController),
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
                          _verificarCredenciales;
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
                  Text(_mensaje,style: const TextStyle(color: Colors.red,)),
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

  void _verificarCredenciales() {
    String usuario = _usuarioController.text;
    String contrasena = _contrasenaController.text;

    // Aquí puedes agregar la lógica para verificar las credenciales
    // Por ejemplo, puedes comparar el usuario y la contraseña con los valores esperados

    if (usuario == 'usuarioCorrecto' && contrasena == 'contrasenaCorrecta') {
      setState(() {
        _mensaje = 'Inicio de sesión correcto';
      });
    } else {
      setState(() {
        _mensaje = 'Usuario o contraseña incorrectos';
      });
    }
  }
}

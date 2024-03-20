import 'package:delivery_1/src/routes/constantes.dart';
import 'package:delivery_1/src/widgets/h1_.dart';
import 'package:delivery_1/src/widgets/headlibre_.dart';
import 'package:delivery_1/src/widgets/input.dart';
import 'package:flutter/material.dart';

class IniciarSession extends StatelessWidget {
  const IniciarSession({super.key});

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
                  input_(label: 'Usuario', type: 'text'),
                  input_(
                      label: 'Contraseña',
                      placeholder_: 'Contraseña',
                      type: 'password'),
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
}

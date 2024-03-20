import 'package:delivery_1/src/widgets/h1_.dart';
import 'package:delivery_1/src/widgets/headlibre_.dart';
import 'package:delivery_1/src/widgets/input.dart';
import 'package:delivery_1/src/routes/constantes.dart';
import 'package:flutter/material.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  bool informacion = false;
  bool condiciones = false;
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
                  h1_(value: 'RELLENE EL FORMULARIO DE REGISTRO'),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Apellidos y nombres:',
                          style: TextStyle(
                              color: ktexto,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ktexto.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Apellidos y nombres',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  input_(label: 'Ingrese su dirección', type: 'text'),
                  input_(label: 'Correo Electronico', type: 'email'),
                  input_(
                      label: 'Contraseña',
                      placeholder_: 'Contraseña',
                      type: 'password'),
                  input_(
                      label: 'Confirmar Contraseña',
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: ktexto,
                              value: informacion,
                              onChanged: (bool? value) {
                                setState(() {
                                  informacion = value ?? false;
                                });
                              }),
                          const Text(
                            'Acepto recibir información',
                            style: TextStyle(color: ktexto),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: ktexto,
                              value: condiciones,
                              onChanged: (bool? value) {
                                setState(() {
                                  condiciones = value ?? false;
                                });
                              }),
                          const Text(
                            'Acepto recibir información',
                            style: TextStyle(color: ktexto),
                          ),
                        ],
                      ),
                    ],
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

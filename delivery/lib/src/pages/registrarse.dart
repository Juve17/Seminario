import 'package:delivery/src/components/label_input.dart';
import 'package:delivery/src/routes/constantes.dart';
import 'package:flutter/material.dart';

class Registrarse extends StatelessWidget {
  const Registrarse({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double alto = screensize.height;
    double ancho = screensize.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,backgroundColor: null,),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: kfondo),
        child: Stack(
          children: [
            Container(
              height: alto - 10,
              width: ancho - 10,
              margin: const EdgeInsets.symmetric(vertical: 90, horizontal: 40),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const Text(
                    'RELLENE EL FORMULARIO DE REGISTRO',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: ktexto),
                    textAlign: TextAlign.center,
                  ),
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
                  labelInput(txttexto: 'Ingrese su dirección'),
                  labelInput(txttexto: 'Correo Electronico'),
                  labelInput(txttexto: 'Contraseña'),
                  labelInput(txttexto: 'Confirmar Contraseña'),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              top: alto - 250,
              child: SizedBox(
                height: 250,
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

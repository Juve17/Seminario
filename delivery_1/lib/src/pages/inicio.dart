
import 'package:delivery_1/src/routes/constantes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 550,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/image/img_1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4)),
                          ),
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Text(
                              'SatipoShops',
                              style: GoogleFonts.kavoon(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 290,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              'assets/image/Vector_1.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Positioned.fill(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Listo para hacer tus compras',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kprimary,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, 'Registrarse');
                                    },
                                    child: const Text(
                                      'Registrate',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Si eres nuevo cliente',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 5),
                      decoration: BoxDecoration(
                        color: kprimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'IniciarSession');
                        },
                        child: const Text(
                          'INICIAR SESIÓN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: Image.asset('assets/image/img_2.png'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

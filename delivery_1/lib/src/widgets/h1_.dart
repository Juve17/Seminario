import 'package:delivery_1/src/routes/constantes.dart';
import 'package:flutter/material.dart';

Text h1_({required String value}) {
    return Text(
                  value,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ktexto),
                  textAlign: TextAlign.center,
                );
  }
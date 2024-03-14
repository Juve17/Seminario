import 'package:delivery/src/routes/constantes.dart';
import 'package:flutter/material.dart';

Container labelInput({required String txttexto, double tamanio = 15}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txttexto,
          style: TextStyle(
              color: ktexto, fontSize: tamanio, fontWeight: FontWeight.bold),
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
            hintText: txttexto,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
      ],
    ),
  );
}

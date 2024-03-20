import 'package:delivery_1/src/routes/constantes.dart';
import 'package:flutter/material.dart';

Container input_(
    {required String label,
    double tamanio = 15,
    String type = 'text',
    String placeholder_ = '',  TextEditingController? controller}) {
  TextInputType keyboardType;
  switch (type) {
    case 'text':
      keyboardType = TextInputType.text;
      break;
    case 'number':
      keyboardType = TextInputType.number;
      break;
    case 'phone':
      keyboardType = TextInputType.phone;
      break;
    case 'email':
      keyboardType = TextInputType.emailAddress;
      break;
    case 'name':
      keyboardType = TextInputType.name;
      break;
    case 'url':
      keyboardType = TextInputType.url;
      break;
    case 'password':
      keyboardType = TextInputType.visiblePassword;
      break;
    // Agrega más casos según tus necesidades
    default:
      keyboardType = TextInputType.text;
  }
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: ktexto, fontSize: tamanio, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: ktexto.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            hintText: placeholder_,
           /*  helperText: placeholder_, */
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
      ],
    ),
  );
}

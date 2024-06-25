// ignore_for_file: sized_box_for_whitespace, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFeild extends StatelessWidget {
  final String name;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final TextInputType? type;


  const InputFeild(
      {super.key,
      required this.name,
      required this.prefixIcon,
      this.suffixIcon,
      this.type});

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: prefixIcon, //Icon(Iconsax.password_check),
                          suffixIcon: suffixIcon, //(Iconsax.eye_slash),
                          labelText: name,
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: GoogleFonts.poppins().fontFamily)),
                    );
  }
}

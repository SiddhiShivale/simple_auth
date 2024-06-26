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
      keyboardType: type,
      cursorColor: Colors.grey,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 145, 145, 145)),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 212, 212, 212))),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: name,
          labelStyle: TextStyle(
              color: Colors.grey,
              fontFamily: GoogleFonts.poppins().fontFamily)),
    );
  }
}

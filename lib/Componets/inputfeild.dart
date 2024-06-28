// ignore_for_file: sized_box_for_whitespace, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFeild extends StatelessWidget {
  final String name;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final TextInputType? type;
  final TextEditingController? controller;

  const InputFeild(
      {super.key,
      required this.name,
      required this.prefixIcon,
      this.suffixIcon,
      this.type,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      cursorColor: Colors.grey,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 32, 31, 31),
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

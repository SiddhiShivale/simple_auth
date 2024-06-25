import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpInputfeild extends StatelessWidget {
  const OtpInputfeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: Colors.white,
        ),
        keyboardType: TextInputType.number,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 47, 45, 45),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 128, 125, 125)),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 250, 88, 60)),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

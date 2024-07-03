import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingText extends StatelessWidget {
  final String name;
  

  const HeadingText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily),
    );
  }
}

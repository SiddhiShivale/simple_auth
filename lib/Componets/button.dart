import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String name;

  const Button({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    return Container(
      width: screenWidth * 1.0,
      height: screenHeight * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 250, 88, 60),
      ),
      child: Align(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

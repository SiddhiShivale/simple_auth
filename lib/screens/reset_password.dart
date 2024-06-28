// ignore_for_file: sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/Componets/heading_text.dart';
import 'package:login_signup_ui/screens/login.dart';

class resetPassword extends StatelessWidget {
  const resetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 120, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  width: 200,
                  height: 200,
                  image: AssetImage(
                      'assets/images/reset_password_illustration.png')),
              Center(child: HeadingText(name: 'Reset Password')),
              SizedBox(height: 20),
              Text(
                "Enter a new password to reset the password on your account. We'll ask for this password whenever you log in.",
                style: TextStyle(
                  color: const Color.fromARGB(255, 128, 125, 125),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                cursorColor: Colors.grey,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 32, 31, 31),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 145, 145, 145)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 212, 212, 212))),
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: Icon(Iconsax.eye_slash),
                    labelText: 'New password',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: GoogleFonts.poppins().fontFamily)),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                cursorColor: Colors.grey,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 32, 31, 31),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 145, 145, 145)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 212, 212, 212))),
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: Icon(Iconsax.eye_slash),
                    labelText: 'Confirm new password',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: GoogleFonts.poppins().fontFamily)),
              ),
              SizedBox(height: 40),
              Button(name: 'Login'),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Know your password?",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      " Log in",
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

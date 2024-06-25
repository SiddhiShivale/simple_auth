// ignore_for_file: sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/screens/LoginPage.dart';

class resetPassword extends StatelessWidget {
  const resetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 60, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child:
                        Image.asset('assets/reset_password_illustration.png'),
                  ),
                ],
              ),
              Text(
                "Reset Password?",
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 380,
                    child: Text(
                      "Enter a new password to reset the password on your account. We'll ask for this password whenever you log in.",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 128, 125, 125),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                  width: screenWidth * 1.0,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 47, 45, 45),
                      hintText: 'New Password',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 128, 125, 125),
                          fontFamily: GoogleFonts.poppins().fontFamily),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 128, 125, 125)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 128, 125, 125)),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.lock_outline),
                      prefixIconColor: const Color.fromARGB(255, 128, 125, 125),
                      suffixIcon: Icon(Iconsax.eye_slash),
                      suffixIconColor: const Color.fromARGB(255, 128, 125, 125),
                    ),
                  )),
              SizedBox(height: 20),
              Container(
                  width: screenWidth * 1.0,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 47, 45, 45),
                      hintText: 'Confirm your password',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 128, 125, 125),
                          fontFamily: GoogleFonts.poppins().fontFamily),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 128, 125, 125)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 128, 125, 125)),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.lock_outline),
                      prefixIconColor: const Color.fromARGB(255, 128, 125, 125),
                      suffixIcon: Icon(Iconsax.eye_slash),
                      suffixIconColor: const Color.fromARGB(255, 128, 125, 125),
                    ),
                  )),
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

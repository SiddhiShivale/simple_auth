// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/Componets/inputfeild.dart';
import 'package:login_signup_ui/screens/SignupPage.dart';
import 'package:login_signup_ui/screens/forgotPassword.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 140, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                InputFeild(name: 'Email', prefixIcon: Icon(Icons.email), type: TextInputType.emailAddress),
                SizedBox(height: 20),
                InputFeild(name: 'Password', prefixIcon: Icon(Iconsax.password_check), type: TextInputType.visiblePassword),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => forgotPassword()));
                      },
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Button(name: "Login"),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    )),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 125, 125)),
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 47, 45, 45),
                      ),
                      child: Container(
                        height: 30,
                        child: Image.asset(
                          'assets/twitter_logo.png',
                          scale: 1,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 125, 125)),
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 47, 45, 45),
                      ),
                      child: Image.asset('assets/google_logo.png'),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 125, 125)),
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 47, 45, 45),
                      ),
                      child: Image.asset('assets/linkedin_logo.png'),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/Componets/heading_text.dart';
import 'package:login_signup_ui/Componets/inputfeild.dart';
import 'package:login_signup_ui/screens/enter_otp.dart';
import 'package:login_signup_ui/screens/login.dart';
import 'package:login_signup_ui/screens/reset_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Get.to(LoginPage());
            },
            child: Icon(Icons.arrow_back, color: Colors.grey)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  width: 200,
                  height: 200,
                  image: AssetImage(
                      'assets/images/forgot_password_illustration.png')),
              SizedBox(height: 20),
              Center(child: HeadingText(name: 'Forget Password?')),
              SizedBox(height: 20),
              Text(
                "Enter the email address you used when you joined and we'll send you instructions to reset you password.",
                style: TextStyle(
                  color: const Color.fromARGB(255, 128, 125, 125),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              InputFeild(
                  name: 'Email',
                  prefixIcon: Icon(Icons.email),
                  type: TextInputType.emailAddress),
              SizedBox(height: 40),
              InkWell(
                  onTap: () {
                    Get.to(resetPassword());
                  },
                  child: Button(name: "Continue"))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/Componets/heading_text.dart';
import 'package:login_signup_ui/Componets/otp_inputfeild.dart';
import 'package:login_signup_ui/screens/forgot_password.dart';
import 'package:login_signup_ui/screens/reset_password.dart';

class enterOtp extends StatelessWidget {
  const enterOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => forgotPassword()));
            },
            child: Icon(Icons.arrow_back, color: Colors.grey)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/enter_otp_illustration.png'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(child: HeadingText(name: 'Enter OTP')),
              SizedBox(height: 20),
              Text(
                "Enter the OTP we sent you at",
                style: TextStyle(
                  color: const Color.fromARGB(255, 128, 125, 125),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "examplemail@gmail.com",
                style: TextStyle(
                  color: const Color.fromARGB(255, 250, 88, 60),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInputfeild(),
                  OtpInputfeild(),
                  OtpInputfeild(),
                  OtpInputfeild(),
                ],
              ),
              SizedBox(height: 40),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => resetPassword()));
                  },
                  child: Button(name: "Continue")),
              SizedBox(height: 40),
              Text(
                "Haven't recieved the OTP?",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Resend",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

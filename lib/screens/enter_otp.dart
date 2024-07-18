// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/Componets/heading_text.dart';
import 'package:login_signup_ui/features/authentication/controllers/otp_controller.dart';
import 'package:login_signup_ui/screens/forgot_password.dart';
import 'package:login_signup_ui/screens/home_screen.dart';
import 'package:login_signup_ui/screens/signup.dart';

class EnterOtp extends StatelessWidget {
  const EnterOtp({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OtpController());
    var otp;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Get.to(SignupPage());
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
                  image:
                      AssetImage('assets/images/enter_otp_illustration.png')),
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
              OtpTextField(
                numberOfFields: 6,
                fieldWidth: 55,
                fieldHeight: 55,
                showFieldAsBox: true,
                borderRadius: BorderRadius.circular(10),
                enabledBorderColor: Colors.grey,
                focusedBorderColor: const Color.fromARGB(255, 250, 88, 60),
                fillColor: Color.fromARGB(255, 32, 31, 31),
                cursorColor: Colors.grey,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20),
                filled: true,
                onSubmit: (code) {
                  otp = code;
                  OtpController.instance.verifyOTP(otp);
                },
              ),
              SizedBox(height: 40),
              InkWell(
                  onTap: () {
                    OtpController.instance.verifyOTP(otp);
                    Get.to(HomeScreen());
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

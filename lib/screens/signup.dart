// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/Componets/heading_text.dart';
import 'package:login_signup_ui/Componets/inputfeild.dart';
import 'package:login_signup_ui/screens/enter_otp.dart';
import 'package:login_signup_ui/screens/login.dart';
import 'package:login_signup_ui/features/authentication/controllers/signup_controller.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool acceptTerms = false;

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 90, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(child: HeadingText(name: 'Sign up')),
                  SizedBox(height: 50),
                  InputFeild(
                      name: 'Full Name',
                      prefixIcon: Icon(Iconsax.user),
                      controller: controller.fullName),
                  SizedBox(height: 20),
                  InputFeild(
                      name: 'Email',
                      prefixIcon: Icon(Iconsax.direct),
                      type: TextInputType.emailAddress,
                      controller: controller.email),
                  SizedBox(height: 20),
                  InputFeild(
                      name: 'Phone no',
                      prefixIcon: Icon(Iconsax.call),
                      controller: controller.phoneNo,
                      type: TextInputType.phone),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    cursorColor: Colors.grey,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 32, 31, 31),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 145, 145, 145)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 212, 212, 212))),
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                  ),
                  SizedBox(height: 15),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        value: acceptTerms,
                        onChanged: (value) {
                          setState(() {
                            acceptTerms = value!;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 250, 88, 60),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'I agree to ',
                          style: TextStyle(color: Colors.white)),
                      TextSpan(
                          text: 'Privacy Policy ',
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(
                          text: 'and ',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      TextSpan(
                          text: 'Terms of Use',
                          style: TextStyle(color: Colors.blue)),
                    ])),
                  ]),
                  SizedBox(height: 40),
                  InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // SignupController.instance.registerUser(
                          //     controller.email.text.trim(),
                          //     controller.password.text.trim());
                          SignupController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnterOtp()));
                        }
                      },
                      child: Button(name: "Continue")),
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
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 128, 125, 125)),
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 47, 45, 45),
                        ),
                        child: Image.asset('assets/images/twitter_logo.png'),
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
                        child: Image.asset('assets/images/google_logo.png'),
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
                        child: Image.asset('assets/images/linkedin_logo.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          " Sign in",
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
      ),
    );
  }
}

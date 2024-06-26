// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/Componets/heading_text.dart';
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
                  TextFormField(
                    controller: controller.fullName,
                    cursorColor: Colors.grey,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 145, 145, 145)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 212, 212, 212))
                        ),
                        prefixIcon: Icon(Icons.person_outline_rounded),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 108, 107, 107),
                            fontFamily: GoogleFonts.poppins().fontFamily),),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.grey),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 108, 107, 107))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 212, 212, 212))
                        ),
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 108, 107, 107),
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.phoneNo,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.grey),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 108, 107, 107))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 212, 212, 212))
                        ),
                        prefixIcon: Icon(Icons.phone_outlined),
                        labelText: 'Phone no',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 108, 107, 107),
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.password,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.grey),
                    //obscureText: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 108, 107, 107))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 212, 212, 212))
                        ),
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 108, 107, 107),
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
                        //fillColor: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "By continuing you accept our Privacy Policy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        Text(
                          "and Terms of Use",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate()) {
                        SignupController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
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
                            'assets/images/twitter_logo.png',
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

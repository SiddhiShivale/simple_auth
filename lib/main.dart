// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_ui/features/authentication/controllers/otp_controller.dart';
import 'package:login_signup_ui/firebase_options.dart';
import 'package:login_signup_ui/repository/authentication_repository/authentication_repository%20.dart';
import 'package:login_signup_ui/screens/profile.dart';

void main() {
  //Before running or generating widgets first initialize the firebase
  WidgetsFlutterBinding
      .ensureInitialized(); //ensure that intialization has been completed
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository())); //once the initialization is completed go to the AuthenticationRepository file

Get.put(OtpController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

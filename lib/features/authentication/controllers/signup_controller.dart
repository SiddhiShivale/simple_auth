import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_ui/features/authentication/models/user_model.dart';
import 'package:login_signup_ui/repository/authentication_repository/authentication_repository%20.dart';
import 'package:login_signup_ui/repository/user_repository/user_repository.dart';
import 'package:login_signup_ui/screens/enter_otp.dart';
import 'package:login_signup_ui/screens/home_screen.dart';

class SignupController extends GetxController {
  //to use getxcontroller wherever you want 
 static SignupController get instance => Get.find(); //with this can easily call SignupController.instance and can use GetxController

 //Textfield controllers to get data from textfields
    final email = TextEditingController();
    final password = TextEditingController();
    final fullName = TextEditingController();
    final phoneNo = TextEditingController();

    final userRepo = Get.put(UserRepository());

    //function which will be called when user press the submit button
    //Call this function from the design and it will do the rest
    void registerUser(String email, String password) {
      AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    }

    Future<void> createUser(UserModel user) async {
      await userRepo.createUser(user);
      phoneAuthentication(user.phoneNo);
       Get.to(EnterOtp());
    }

    //Get phoneNo from user and pass it to Auth Repository for Firebase Authentication
    void phoneAuthentication(String phoneNo) {
      AuthenticationRepository.instance.phoneAuthentication(phoneNo);
      Get.to(() => const HomeScreen());
    }
}
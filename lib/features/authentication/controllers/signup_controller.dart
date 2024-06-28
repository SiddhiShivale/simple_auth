import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_ui/repository/authentication_repository/authentication_repository%20.dart';

class SignupController extends GetxController {
  //to use getxcontroller wherever you want 
 static SignupController get instance => Get.find(); //with this can easily call SignupController.instance and can use GetxController

 //Textfield controllers to get data from textfields
    final email = TextEditingController();
    final password = TextEditingController();
    final fullName = TextEditingController();
    final phoneNo = TextEditingController();

    //function which will be called when user press the submit button
    //Call this function from the design and it will do the rest
    void registerUser(String email, String password) {
      AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    }

    void phoneAuthentication(String phoneNo) {
      AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    }
}
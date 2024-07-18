// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, avoid_print

//Todo: Step 2 [User repository to perform Database operations]
//This UserRepository is going to contain all the queries related to firestore for the user like create, update, delete, get all users, etc.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_ui/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  //To use the firestore we first need to point our application to the database
  final _db = FirebaseFirestore
      .instance; //Now currently we are pointing to the root of our database

  //Store user in database
  createUser(UserModel user) async {
    //await is going to wait for this query to be completed otherwise its going to execute this query and jump towards next line  
    //first point to the databse => inside the collection specify in which collection you want to go => then specify what action to be performed here it is to crate user  
    await _db.collection("Users").add(user.toJson()).whenComplete( 
        () => Get.snackbar("Success", "Your account has been created",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green
        ))
    .catchError((error, StackTrace) { //15 mins baki ahe tovar abhyas kar OK kay kela magapasun OK what
       Get.snackbar("Error", "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.red
       ); 
       print(error.toString());
    });
  }

  //Step 2 => Fetch all users or user details 
  Future<UserModel> getUserDetails(String email) async {
    //There are two scenarios while fetching the data => there might be a need of to fetch the single record or there might be a need of to fetch all the records 
    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData; 
  }
  //Above function is for the single record only 

  Future<List<UserModel>> allUser() async {
    //There are two scenarios while fetching the data => there might be a need of to fetch the single record or there might be a need of to fetch all the records 
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData; 
  }

  //Update user details in firebase flutter 
  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}

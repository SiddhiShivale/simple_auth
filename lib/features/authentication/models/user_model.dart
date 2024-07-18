//Todo: Step 1 [Create Model]

//When we will call the UserModel the data under it will be converted into Json by using / calling the toJson function

// ---- To store data into the firebase ----
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.phoneNo,
      required this.password});

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  // ---- To fetch data from the database ----
  //Step 1 => Map user fetched from firebase to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      id: document.id,       
      fullName: data["FullName"], 
      email: data["Email"], 
      phoneNo: data["Phone"], 
      password: data["Password"]);
  }


}

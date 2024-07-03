// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_signup_ui/Componets/inputfeild.dart';
import 'package:login_signup_ui/screens/profile.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: Icon(
              LineAwesomeIcons.angle_left_solid,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text('Edit Profile',
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                              image: AssetImage('assets/images/profile.jpg')))),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromARGB(255, 250, 88, 60)),
                        child: Icon(LineAwesomeIcons.camera_solid,
                            size: 18.0, color: Colors.white)),
                  )
                ],
              ),
              Divider(color: Colors.black),
              SizedBox(height: 40),
              InputFeild(name: 'Full Name', prefixIcon: Icon(Iconsax.user)),
              SizedBox(height: 20),
              InputFeild(
                name: 'Email',
                prefixIcon: Icon(Iconsax.direct),
                type: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              InputFeild(
                  name: 'Phone no',
                  prefixIcon: Icon(Iconsax.call),
                  type: TextInputType.phone),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                cursorColor: Colors.grey,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 32, 31, 31),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 145, 145, 145)),
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
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 250, 88, 60)),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text: 'Joined ',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Colors.white),
                      children: [
                        TextSpan(
                          text: '3 July 2024',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.grey),
                        )
                      ])),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(0.1)),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}

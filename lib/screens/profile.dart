// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_signup_ui/Componets/listTile.dart';
import 'package:login_signup_ui/screens/home_screen.dart';
import 'package:login_signup_ui/screens/update_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            icon: Icon(
              LineAwesomeIcons.angle_left_solid,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text('Profile',
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
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
                        child: Icon(LineAwesomeIcons.pencil_alt_solid,
                            size: 18.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Siddhi Shivale',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18),
              ),
              Text(
                'siddhishivale1@gmail.com',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(UpdateProfileScreen());
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 250, 88, 60)),
                ),
              ),
              Divider(color: Colors.black),
              SizedBox(height: 20),
              Listtile(
                  title: 'Settings',
                  leadingIcon: Icons.settings,
                  onPress: () {},
                  endIcon: true),
              Listtile(
                  title: 'Billing Details',
                  leadingIcon: LineAwesomeIcons.wallet_solid,
                  onPress: () {},
                  endIcon: true),
              Listtile(
                  title: 'User Management',
                  leadingIcon: LineAwesomeIcons.user_check_solid,
                  onPress: () {},
                  endIcon: true),
              Divider(color: Colors.black),
              SizedBox(height: 20),
              Listtile(
                  title: 'Information',
                  leadingIcon: LineAwesomeIcons.info_solid,
                  onPress: () {},
                  endIcon: true),
              Listtile(
                title: 'Logout',
                leadingIcon: LineAwesomeIcons.sign_out_alt_solid,
                onPress: () {},
                endIcon: false,
                textcolor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getUserData() {}

  getAllUsers() {}
}

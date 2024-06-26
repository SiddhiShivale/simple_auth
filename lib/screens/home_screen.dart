// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login_signup_ui/Componets/button.dart';
import 'package:login_signup_ui/screens/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                width: 300,
                height: 300,
                image:
                    AssetImage('assets/images/home_screen_illustration.png')),
            SizedBox(height: 60),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Button(
                name: 'Log out',
              ),
            )
          ],
        ),
      ),
    );
  }
}

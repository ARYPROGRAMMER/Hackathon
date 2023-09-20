// all apis here

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodify/Login.dart';

import 'package:moodify/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<Splashing> {
  static const String KEYLOGIN = "login";


  @override
  void initState() {
    super.initState();
    whereToGo();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4e4e94), Color(0xFFAA336A)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/new_logo.png",
              height: 300,
              width: 300,
            ),
            Text(
              "LOADING MOODIFY...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "FontMain2",
                color: Colors.white,
              ),
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  void whereToGo() async {
    var prefs = await SharedPreferences.getInstance();
    var isloggedin = prefs.getBool(KEYLOGIN);

    if (isloggedin != null) {
      if (isloggedin) {
        Timer(Duration(seconds: 7), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SplashScreen()));
        });
      } else {
        Timer(Duration(seconds: 7), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        });
      }
    } else {
      Timer(Duration(seconds: 7), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    }
  }
}

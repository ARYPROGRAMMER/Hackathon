import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moodify/components/components.dart';
import 'package:moodify/screens/login_screen.dart';
import 'package:moodify/screens/newscreen.dart';
import 'package:moodify/screens/signup_screen.dart';
import 'package:moodify/splashing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:linkify/linkify.dart';

import '../Login.dart';
import '../splash_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'home_screen';
  @override
  State<HomeScreen> createState() => HomeScreenState();

}

class HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();


    whereToGo();}


  String? url;
  bool isImageURL(String url) {
    var link = extractURL(url);

    if (link != null) {
      return (link.endsWith('jpg') ||
          link.endsWith('jpeg') ||
          link.endsWith('png') ||
          link.endsWith('webp') ||
          link.endsWith('avif') ||
          link.endsWith('gif') ||
          link.endsWith('svg'));
    } else {
      return false;
    }
  }

  bool isStringAnURL(String url) {
    var link = extractURL(url);
    if (link != null) {
      try {
        bool _validURL = Uri.parse(link).isAbsolute;
        return _validURL;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  String? extractURL(String text) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String parsedstring1 = text.replaceAll(exp, ' ');

    var list = linkify(parsedstring1);
    for (var i in list) {
      if (i.runtimeType == UrlElement) {
        return i.originText;
      }
    }
    return null;
  }

  String? extractText(String text) {
    var list = linkify(text);
    for (var i in list) {
      if (i.runtimeType == TextElement) {
        return i.originText;
      }
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TopScreenImage(screenImageName: 'health.png'),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const ScreenTitle(title: 'Namaste'),
                      const Text(
                        'Welcome to Moodify , LETS SPREAD HAPPINESS TOGETHER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Hero(
                        tag: 'login_btn',
                        child: CustomButton(
                          buttonText: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: 'signup_btn',
                        child: CustomButton(
                          buttonText: 'Sign Up',
                          isOutlined: true,
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Sign up using',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async{


                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool(SplashPageState.KEYLOGIN,true);
                              launchUrl(Uri.parse(
                                  "https://facebook.com"));
                              Timer(Duration(seconds: 2, milliseconds: 5), () {
                                Navigator.pushReplacementNamed(context, NewScreen.id);
                              });




                            },
                            icon: CircleAvatar(
                              radius: 25,
                              child: Image.asset(
                                  'assets/images/icons/facebook.png'),
                            ),
                          ),

                          IconButton(
                            onPressed: () async{
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool(SplashPageState.KEYLOGIN,true);

                              launchUrl(Uri.parse(
                                  "https://google.com"));
                              Timer(Duration(seconds: 2, milliseconds: 5), () {
                                Navigator.pushReplacementNamed(context, NewScreen.id);
                              });




                            },
                            icon: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child:
                                  Image.asset('assets/images/icons/google.png'),
                            ),
                          ),
                          IconButton(
                            onPressed: () async{
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool(SplashPageState.KEYLOGIN,true);


                              launchUrl(Uri.parse(
                                  "https://linkedin.com"));

                              Timer(Duration(seconds: 2, milliseconds: 5), () {
                                Navigator.pushReplacementNamed(context, NewScreen.id);
                              });




                            },
                            icon: CircleAvatar(
                              radius: 25,
                              child: Image.asset(
                                  'assets/images/icons/linkedin.png'),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void whereToGo() async {

    var prefs = await SharedPreferences.getInstance();
    var isloggedin = prefs.getBool(SplashPageState.KEYLOGIN);

    if (isloggedin != null) {
      if (isloggedin) {

        Timer(Duration(seconds: 7,milliseconds: 5),(){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SplashScreen()));
        });
      } else {

        Timer(Duration(seconds: 70000,milliseconds: 5),()
        {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        });
      }
    } else {

      Timer(Duration(seconds: 70000,milliseconds: 5),()
      {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:moodify/screens/home_screen.dart';
import 'package:moodify/screens/login_screen.dart';
import 'package:moodify/screens/newscreen.dart';
import 'package:moodify/screens/signup_screen.dart';



void main() {

  runApp(const Login());

}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontFamily: 'FontMain',
            ),
          )),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        NewScreen.id: (context) => const NewScreen(),
      },
    );
  }
}
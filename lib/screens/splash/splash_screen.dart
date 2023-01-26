import 'package:flutter/material.dart';
import 'package:kijam_vision21tech/constants.dart';
import 'package:kijam_vision21tech/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
    });

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
          child: Image.asset('assets/images/SplashScreen.png'),
        ));
  }
}

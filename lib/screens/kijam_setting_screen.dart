import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kijam_vision21tech/screens/welcome_screen.dart';
import 'package:get/get.dart';

class KijamSettingScreen extends StatefulWidget {
  static String routeName = "/kijam_setting";

  @override
  _KijamSettingScreenState createState() => _KijamSettingScreenState();
}

class _KijamSettingScreenState extends State<KijamSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background.png'),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 60,
              ),
              onPressed: () {
                Get.to(() => WelcomeScreen());
              },
            ),
          ),
        ),
      ),
    );
  }
}
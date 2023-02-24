import 'package:flutter/material.dart';
import 'package:kijam_vision21tech/screens/kijam_setting_screen.dart';
import 'package:kijam_vision21tech/screens/kindergartens_list_screen.dart';
import 'package:kijam_vision21tech/screens/splash/splash_screen.dart';
import 'package:kijam_vision21tech/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> route = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  KijamSettingScreen.routeName: (context) => KijamSettingScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  KindergartensListScreen.routeName: (context) => KindergartensListScreen(),
};

import 'package:flutter/material.dart';
import 'package:kijam_vision21tech/constants.dart';

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: kDarkFontColor, fontFamily: 'Godo', fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: kWhiteFontColor,
        fontFamily: 'Godo',
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: kDarkFontColor,
        fontFamily: 'Godo',
        fontWeight: FontWeight.normal),
    button: TextStyle(
        color: kDarkFontColor, fontFamily: 'Godo', fontWeight: FontWeight.bold),
    labelMedium: TextStyle(
        color: kDarkFontColor,
        fontFamily: 'Godo',
        fontWeight: FontWeight.normal),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
    toolbarHeight: 100,
    color: kBackgroundColor,
    elevation: 0.0,
    textTheme: TextTheme(
      headline2: TextStyle(
          color: kWhiteFontColor,
          fontFamily: 'Godo',
          fontWeight: FontWeight.bold),
    ),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: appTheme(),
    textTheme: textTheme(),
  );
}

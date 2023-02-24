import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kijam_vision21tech/constants.dart';

class KindergartensListScreen extends StatefulWidget {
  static String routeName = "/kindergartenslist";

  @override
  _KindergartensListScreenState createState() =>
      _KindergartensListScreenState();
}

class _KindergartensListScreenState extends State<KindergartensListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text('KindergartensListScreen'),
      ),
    );
  }
}
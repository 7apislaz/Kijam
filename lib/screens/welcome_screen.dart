import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kijam_vision21tech/constants.dart';
import 'package:kijam_vision21tech/db/dbHelper.dart';
import 'package:kijam_vision21tech/model/kid.dart';
import 'package:kijam_vision21tech/module/button.dart';
import 'package:kijam_vision21tech/module/audio.dart';
import 'kijam_setting_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/main";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ButtonAudios buttonAudios = ButtonAudios();

  @override
  int touchCount = 0;

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background.png'),
          ),
        ),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 140),
              GestureDetector(
                onTap: () {
                  touchCount++;
                  if (touchCount == 3) {
                    Get.to(() => KijamSettingScreen());
                  }
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  alignment: Alignment.topLeft,
                  width: 720,
                  height: 80,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 100, right: 100),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kindergarten.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 100.0, right: 100.0, bottom: 180.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Kiosk_Button(
                        text: '키 재기',
                        textScale: 5,
                        maxiSize: Size(500, 160),
                        miniSize: Size(500, 160),
                        buttonColor: kOrangeButtonColor,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        onPressed: () {
                          buttonAudios.playAudio('assets/audios/button_effect.mp3');
                          //Get.to(() => KidListScreen());
                          DBHelper dbHelper = DBHelper();
                          dbHelper.insertKid(Kid(key: 1, name: 'asd', age: 6));
                        }),
                    SizedBox(height: 70),
                    Kiosk_Button(
                      text: '감정 수집',
                      textScale: 5,
                      maxiSize: Size(500, 160),
                      miniSize: Size(500, 160),
                      buttonColor: kOrangeButtonColor,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      onPressed: () {
                        buttonAudios.playAudio('assets/audios/button_effect.mp3');
                        //Get.to(() => EmotionKidListScreen());
                        DBHelper dbHelper = DBHelper();
                        dbHelper.getAllKid().then((value) => value.forEach((element) {
                          print(element.name);
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

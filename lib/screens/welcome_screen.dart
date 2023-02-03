import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kijam_vision21tech/constants.dart';
import 'package:kijam_vision21tech/db/dbHelper.dart';
import 'package:kijam_vision21tech/model/emotion_data.dart';
import 'package:kijam_vision21tech/model/kid.dart';
import 'package:kijam_vision21tech/model/measured_data.dart';
import 'package:kijam_vision21tech/module/button.dart';
import 'package:kijam_vision21tech/module/audio.dart';
import '../model/kindergartens.dart';
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
                        text: '아이생성',
                        textScale: 2,
                        maxiSize: Size(200, 100),
                        miniSize: Size(200, 100),
                        buttonColor: kOrangeButtonColor,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        onPressed: () {
                          //buttonAudios.playAudio('assets/audios/button_effect.mp3');
                          //Get.to(() => EmotionKidListScreen());
                          DBHelper dbHelper = DBHelper();
                          dbHelper.insertKid(Kid(inf_key: 's', tag: 's', name: 'd', gender: 'male', age: 'b', classroom: 'n', picture: 'v', update_datetime: 'as', is_active: 'True'));
                        }),
                    SizedBox(height: 30),
                    Kiosk_Button(
                      text: '반생성',
                      textScale: 2,
                      maxiSize: Size(200, 100),
                      miniSize: Size(200, 100),
                      buttonColor: kOrangeButtonColor,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      onPressed: () {
                        //buttonAudios.playAudio('assets/audios/button_effect.mp3');
                        //Get.to(() => EmotionKidListScreen());
                        DBHelper dbHelper = DBHelper();
                        dbHelper.insertKindergartens(Kindergartens(key: '2', updated_datetime: '2021-01-01', name: 'asd'));
                        }),
                    SizedBox(height: 30),
                    Kiosk_Button(
                        text: '감생',
                        textScale: 2,
                        maxiSize: Size(200, 100),
                        miniSize: Size(200, 100),
                        buttonColor: kOrangeButtonColor,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        onPressed: () {
                          //buttonAudios.playAudio('assets/audios/button_effect.mp3');
                          //Get.to(() => EmotionKidListScreen());
                          DBHelper dbHelper = DBHelper();
                          dbHelper.insertEmotionData(EmotionData(id: 's', selected_play: 'd', measured_datetime: 'q', emotion: 'e', inf_key: 'w'));
                        }),
                    SizedBox(height: 30),
                    Kiosk_Button(
                        text: '측생',
                        textScale: 2,
                        maxiSize: Size(200, 100),
                        miniSize: Size(200, 100),
                        buttonColor: kOrangeButtonColor,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        onPressed: () {
                          //buttonAudios.playAudio('assets/audios/button_effect.mp3');
                          //Get.to(() => EmotionKidListScreen());
                          DBHelper dbHelper = DBHelper();
                          dbHelper.insertMeasuredData(MeasuredData(height: 's', weight: 'w', measured_datetime: 'e', inf_key: 'r'));
                        }),
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

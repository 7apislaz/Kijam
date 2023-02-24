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
import 'package:short_uuids/short_uuids.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/main";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ButtonAudios buttonAudios = ButtonAudios();
  var uuid = ShortUuid();
  String inputText1 = '';
  String inputText2 = '';
  String inputText3 = '';

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  FocusNode myFocusNode3 = FocusNode();

  String _KindergartenName = '';

  @override
  int touchCount = 0;
  var now = new DateTime.now();

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
              // Expanded(
              //   flex: 2,
              //   child: Container(
              //     margin: EdgeInsets.only(left: 100, right: 100),
              //     decoration: const BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage('assets/images/kindergarten.png'),
              //         fit: BoxFit.contain,
              //       ),
              //     ),
              //   ),
              // ),
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
                          dbHelper.insertKid(Kid(
                              inf_key: uuid.generate(),
                              tag: 's',
                              name: 'd',
                              gender: 'male',
                              age: '10',
                              classroom: 'n',
                              picture: 'v',
                              update_datetime: '${DateTime.now()}',
                              is_active: 'True'));
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
                          _CreateKindergartens();
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
                          print(DateTime.now());
                          print(uuid.generate().runtimeType);
                          print('${DateTime.now()}');
                          DBHelper dbHelper = DBHelper();
                          dbHelper.insertEmotionData(EmotionData(
                              selected_play: 'd',
                              measured_datetime: '${DateTime.now()}',
                              emotion: 'e',
                              inf_key: uuid.generate()));
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
                          print(DateTime.now());
                          DBHelper dbHelper = DBHelper();
                          dbHelper.insertMeasuredData(MeasuredData(
                              height: 's',
                              weight: 'w',
                              measured_datetime: '${DateTime.now()}',
                              inf_key: uuid.generate()));
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

  void _CreateKindergartens() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          titlePadding:
              EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
          contentPadding: EdgeInsets.only(right: 30, left: 30),
          actionsPadding:
              EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
          title: Text("반 생성",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Godo',
                fontWeight: FontWeight.normal,
                fontSize: 30,
                color: kDarkFontColor,
              )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: SizedBox(
                  height: 60,
                  child: Text(
                    "새로 생성할 반 이름을 입력해주세요.",
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: kDarkFontColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  height: 60,
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontWeight: FontWeight.normal,
                    ),
                    focusNode: myFocusNode1,
                    controller: _controller1,
                    onChanged: (classname) {
                      setState(() {
                        _KindergartenName = classname;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "반 이름",
                      labelStyle: TextStyle(
                          fontFamily: 'Godo',
                          fontWeight: FontWeight.normal,
                          color: myFocusNode1.hasFocus
                              ? kOrangeButtonColor
                              : kGrayFontColor),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1.5, color: kOrangeButtonColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(width: 1.5, color: kDarkFontColor)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                backgroundColor: kOrangeButtonColor,
                maximumSize: Size(130, 50),
                minimumSize: Size(130, 50),
              ),
              child: new Text("생성"),
              onPressed: () {
                DBHelper dbHelper = DBHelper();
                dbHelper.insertKindergartens(Kindergartens(
                    key: uuid.generate(),
                    updated_datetime: '${DateTime.now()}',
                    name: _KindergartenName));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                backgroundColor: kOrangeButtonColor,
                maximumSize: Size(130, 50),
                minimumSize: Size(130, 50),
              ),
              child: new Text("취소"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kijam_vision21tech/screens/kindergartens_list_screen.dart';
import 'package:kijam_vision21tech/screens/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:short_uuids/short_uuids.dart';

import '../constants.dart';
import '../db/dbHelper.dart';
import '../model/emotion_data.dart';
import '../model/kid.dart';
import '../model/kindergartens.dart';
import '../model/measured_data.dart';
import '../module/audio.dart';
import '../module/button.dart';

class KijamSettingScreen extends StatefulWidget {
  static String routeName = "/kijam_setting";

  @override
  _KijamSettingScreenState createState() => _KijamSettingScreenState();
}

class _KijamSettingScreenState extends State<KijamSettingScreen> {
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
  var now = new DateTime.now();

  void initState() {
    super.initState();
    _controller1.addListener(() {
      setState(() {
        inputText1 = _controller1.text;
      });
    });
    _controller2.addListener(() {
      setState(() {
        inputText2 = _controller2.text;
      });
    });
    _controller3.addListener(() {
      setState(() {
        inputText3 = _controller3.text;
      });
    });
  }
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

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
          body: SafeArea(
            minimum: EdgeInsets.only(top: 60, bottom: 60),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: kOrangeButtonColor,
                              borderRadius: BorderRadius.circular(10),
                              ),
                            child: const Center(
                              child: Text(
                                "반 추가/수정",
                                textScaleFactor: 2,
                                style: TextStyle(color: kWhiteFontColor),
                              ),
                            )
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kOrangeButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _query();
                            },
                            child: Text(
                              "반 쿼리",
                              textScaleFactor: 2,
                              style: TextStyle(color: kWhiteFontColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.to(() => KindergartensListScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "반 수정",
                              textScaleFactor: 2.2,
                              style: TextStyle(color: kGrayFontColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kOrangeButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _CreateKindergartens();
                            },
                            child: Text(
                              "반 추가/수정",
                              textScaleFactor: 2,
                              style: TextStyle(color: kWhiteFontColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                color: kOrangeButtonColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "API-KEY 발급",
                                  textScaleFactor: 2,
                                  style: TextStyle(color: kWhiteFontColor),
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
    }

  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async => false,
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       height: MediaQuery.of(context).size.height,
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           fit: BoxFit.fill,
  //           image: AssetImage('assets/images/background.png'),
  //         ),
  //       ),
  //       child: Scaffold(
  //         appBar: AppBar(
  //           leading: IconButton(
  //             icon: Icon(
  //               Icons.arrow_back_rounded, size: 60,
  //             ),
  //             onPressed: () {
  //               Get.to(() => WelcomeScreen());
  //             },
  //           ),
  //         ),
  //         body: SafeArea(
  //           minimum: EdgeInsets.only(top: 60, bottom: 60),
  //           child: GestureDetector(
  //             onTap: () => FocusScope.of(context).unfocus(),
  //             child: SingleChildScrollView(
  //               child: Column(
  //                  crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(
  //                     top: 60, left: 100.0, right: 100.0, bottom: 180.0),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                     Kiosk_Button(
  //                       text: '아이생성',
  //                       textScale: 2,
  //                       maxiSize: Size(200, 100),
  //                       miniSize: Size(200, 100),
  //                       buttonColor: kOrangeButtonColor,
  //                       textStyle: Theme.of(context).textTheme.bodyText1,
  //                       onPressed: () {
  //                       //buttonAudios.playAudio('assets/audios/button_effect.mp3');
  //                       //Get.to(() => EmotionKidListScreen());
  //                       DBHelper dbHelper = DBHelper();
  //                       dbHelper.insertKid(Kid(inf_key: uuid.generate(), tag: 's', name: 'd', gender: 'male', age: 'b', classroom: 'n', picture: 'v', update_datetime: '${DateTime.now()}', is_active: 'True'));
  //                       }),
  //                     SizedBox(height: 30),
  //                     Kiosk_Button(
  //                       text: '반생성',
  //                       textScale: 2,
  //                       maxiSize: Size(200, 100),
  //                       miniSize: Size(200, 100),
  //                       buttonColor: kOrangeButtonColor,
  //                       textStyle: Theme.of(context).textTheme.bodyText1,
  //                       onPressed: () {
  //                       //buttonAudios.playAudio('assets/audios/button_effect.mp3');
  //                       _CreateKindergartens();
  //                       }),
  //                     SizedBox(height: 30),
  //                     Kiosk_Button(
  //                       text: '감생',
  //                       textScale: 2,
  //                       maxiSize: Size(200, 100),
  //                       miniSize: Size(200, 100),
  //                       buttonColor: kOrangeButtonColor,
  //                       textStyle: Theme.of(context).textTheme.bodyText1,
  //                       onPressed: () {
  //                       //buttonAudios.playAudio('assets/audios/button_effect.mp3');
  //                       //Get.to(() => EmotionKidListScreen());
  //                       print(DateTime.now());
  //                       print(uuid.generate().runtimeType);
  //                       print('${DateTime.now()}');
  //                       DBHelper dbHelper = DBHelper();
  //                       dbHelper.insertEmotionData(EmotionData(selected_play: 'd', measured_datetime: '${DateTime.now()}', emotion: 'e', inf_key: uuid.generate()));
  //                       }),
  //                       SizedBox(height: 30),
  //                       Kiosk_Button(
  //                       text: '측생',
  //                       textScale: 2,
  //                       maxiSize: Size(200, 100),
  //                       miniSize: Size(200, 100),
  //                       buttonColor: kOrangeButtonColor,
  //                       textStyle: Theme.of(context).textTheme.bodyText1,
  //                       onPressed: () {
  //                       //buttonAudios.playAudio('assets/audios/button_effect.mp3');
  //                       //Get.to(() => EmotionKidListScreen());
  //                       print(DateTime.now());
  //                       DBHelper dbHelper = DBHelper();
  //                       dbHelper.insertMeasuredData(MeasuredData(height: 's', weight: 'w', measured_datetime: '${DateTime.now()}', inf_key: uuid.generate()));
  //                       }),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
              child: Text("생성", textScaleFactor: 2,),
              onPressed: () {
                if (_KindergartenName.isEmpty) {
                  return _vaildate("반 이름을 입력해주세요.");
                }
                if (_KindergartenName.isNotEmpty) {
                  DBHelper dbHelper = DBHelper();
                  dbHelper.insertKindergartens(
                      Kindergartens(
                          key: uuid.generate(),
                          updated_datetime: '${DateTime.now()}',
                          name: _KindergartenName));
                }
              }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                backgroundColor: kGrayButtonColor,
                maximumSize: Size(130, 50),
                minimumSize: Size(130, 50),
              ),
              child: new Text("취소", textScaleFactor: 2,),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  void _vaildate(myText) async {
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
              title: Text("Error"),
              content: Text(
                myText,
                style: TextStyle(
                  fontFamily: 'Godo',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: kDarkFontColor,
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    backgroundColor: kOrangeButtonColor,
                    maximumSize: Size(130, 50),
                    minimumSize: Size(130, 50),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "확인",
                    style: TextStyle(
                      color: kDarkFontColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ]);
        });
  }
  void _query() async {
    DBHelper dbHelper = DBHelper();
    var list = await dbHelper.getAllKindergartens();
    print(list[0].name);

    for(var item in list) {
      print(item.name);
      print(item.key);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kijam_vision21tech/constants.dart';
import 'package:kijam_vision21tech/db/dbHelper.dart';
import 'package:kijam_vision21tech/screens/welcome_screen.dart';

import '../data/mydata.dart';

class KindergartensListScreen extends StatefulWidget {
  static String routeName = "/kindergartenslist";

  @override
  _KindergartensListScreenState createState() =>
      _KindergartensListScreenState();
}

class _KindergartensListScreenState extends State<KindergartensListScreen> {
  final MyData myData = Get.put(MyData(
    key: '',
  ));
  var kindergartensName = '';
  var kindergartensPic = '';
  List KindergartensList = [];
  bool isLoading = true;
  DBHelper dbHelper = DBHelper();
  Future initKindergartens() async {
    KindergartensList = await dbHelper.getAllKindergartens();
  }
  @override
  void initState() {
    super.initState();
    initKindergartens().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
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
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded, size: 60,),
              onPressed: () {
                Get.off(() => WelcomeScreen());
              },
            ),
          ),
          body: isLoading ? Center(child: const CircularProgressIndicator(),):
          SafeArea(
            minimum: EdgeInsets.only(top: 60, bottom: 60, right: 60, left: 60),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 6,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: KindergartensList.length,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.all(6),
                  elevation: 4,
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: kOrangeButtonColor,
                      title: Text(KindergartensList[index].name!,
                        style: TextStyle(
                            fontSize: 20,
                            color: kDarkFontColor,
                            fontFamily: 'Godo',
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          kindergartensName = KindergartensList[index].name!;
                          kindergartensPic = KindergartensList[index].pic!;
                          myData.key = KindergartensList[index].key;
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: EdgeInsets.only(
                                      top: 100, bottom: 60, right: 60, left: 60),
                                  contentPadding:
                                  EdgeInsets.only(right: 60, left: 60),
                                  actionsPadding: EdgeInsets.only(
                                      top: 60, bottom: 100, right: 60, left: 60),
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: Text('$kindergartensName 친구야 안녕!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Godo',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 50,
                                        color: kDarkFontColor,
                                      )),
                                  content: SingleChildScrollView(
                                    child: InkWell(
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        alignment:
                                        AlignmentDirectional.bottomCenter,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage("assets/images/kindergarten.png"),
                                            //image: NetworkImage(kidPic),
                                          ),
                                        ),
                                        width: 400,
                                        height: 400,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kOrangeButtonColor,
                                        maximumSize: Size(260, 100),
                                        minimumSize: Size(260, 100),
                                      ),
                                      onPressed: () {
                                        Get.to(() => WelcomeScreen(), arguments: [
                                          myData.key,
                                        ]);
                                      },
                                      child: Text(
                                        "맞아요!",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kGrayButtonColor,
                                        maximumSize: Size(260, 100),
                                        minimumSize: Size(260, 100),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        "아니에요!",
                                        style: TextStyle(
                                            fontSize: 30, color: kDarkFontColor),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/images/kindergarten.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'dart:convert';
//import 'package:assets_audio_player/assets_audio_player.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:date_field/date_field.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pfe/api/login_api.dart';
import 'package:pfe/screens/anonyme/componants/nav_bar.dart';
import 'package:pfe/screens/evaluation/result.dart';
import 'package:pfe/screens/logged_in/componants/test_dig.dart';
import 'package:pfe/screens/logged_in/logged_in.dart';
import 'package:pfe/screens/logged_in/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

//void main() => runApp(GeneralHealth());

class EvalDig extends StatelessWidget {
  final int id;
  const EvalDig({Key key, @required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: id == 0
              ? Home1()
              : id == 1
                  ? Home2()
                  : id == 3
                      ? Home3()
                      : id == 2
                          ? Home4()
                          : AlertDialog(
                              title: Text('error'),
                            )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home1 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home1> {
  var n = 0;
  var score = 0;
  List que = [
    questions(
        "شحال فيك فالسخانة؟", "assets/images/sick.png", "bool", true, "", null),
    questions("امتا بانت هاد الأعراض؟", null, "string", null, "", null),
    questions(" شحال من مرة كتجيك فالنهار؟", null, "int", null, "", null),
    questions(" شحال كتبقا فالنهار؟", null, "int", null, "", null),
    questions(" شحال من مرة كتاكل فالنهار؟", null, "int", null, "", null),
    questions("كتحس بحلقك ناشف؟", "assets/images/no-water.png", "bool", true,
        "", null),
    questions(
        "كتحس باضطراب عصبي؟", "assets/images/pain.png", "bool", true, "", null),
    questions("واش البول ولا غامق؟", "assets/images/dark-urine.png", "bool",
        true, "", null),
    questions("واش البول ولا قليل؟", null, "bool", true, "", null),
    questions("واش الوزن ديالك نقص؟", "assets/images/weight-loss.png", "bool",
        true, "", null),
    questions("واش خديتي علاج قبل؟", null, "bool", true, "", null),
    questions(" وليتي حسن بالعلاج؟ ", null, "bool", true, "", null),
  ];
  String _toString(int n) {
    if (que[n].ans1) {
      return '1';
    } else {
      return '0';
    }
  }

  Future<String> addData() async {
    //String myUrl = "http://192.168.34.87:8000/api/etatgeneral";
    String myUrl = 'nausee_vomissements';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      'fievre': _toString(0),
      'momentApparition': que[1].ans2,
      'nbEpisodesParJr': que[2].ans3.toString(),
      'DureeParJr': que[3].ans3.toString(),
      'nbrRepasParJr': que[4].ans3.toString(),
      'Déshydratation': _toString(5),
      'troubleNeurologique': _toString(5),
      'urinerPlusFoncer': _toString(6),
      'urinermoinsFrequente': _toString(7),
      'pertePoids': _toString(8),
      'taraitementPrecis': _toString(9),
      'AmelioreSoustaraitement': _toString(10)
    }).then((response) {
      var body = json.decode(response.body);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
                    grade: body['nausee_vomissements grade'],
                    symp: body['Symptom'].toString(),
                    tox: body['tox'].toString(),
                  ))));
    });
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void check(bool choice, String choice2, int choice3, BuildContext ctx) {
    setState(
      () {
        que[n].ans1 = choice;
        que[n].ans2 = choice2;
        que[n].ans3 = choice3;
        print(que[n].ans1);
        print(que[n].ans2);
        print(que[n].ans3);
        if (n < que.length - 1) {
          n = n + 1;
        } else {
          addData();
          //Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: ((context) => Directionality(
          //           textDirection: TextDirection.rtl,
          //           child: FutureBuilder<String>(builder: (context, snapshot) {
          //             String data = snapshot.data;
          //             return Result(grade: '${data}');
          //           })))),
          // );
        }
      },
    );
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)

  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  //AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // iconController = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 1000));

    // audioPlayer.open(
    //   const Audio('assets/sound/Recording.m4a'),
    //   autoStart: false,
    //   //showNotification: true
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/icons/x.png',
                          ),
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Test())),
                      ),
                    )
                    // Text(
                    //   "",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: "DMSans",
                    //       fontSize: 20),
                    // ),
                    // Text(
                    //   " الحالة العامة",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: "DMSans",
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                    // Text(
                    //   " False",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                  ],
                ),
              ),
              elevation: 0,
              centerTitle: false,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Builder(
            builder: (ctx) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(40),
                    // child: ClipRRect(
                    //     borderRadius:
                    //         BorderRadius.vertical(top: Radius.circular(50)),
                    child: que[n].imgurl != null
                        ? Image.asset(
                            que[n].imgurl,
                            width: 100,
                          )
                        : Container()),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 105.0,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.vertical(bottom: Radius.circular(50)),
                  //     border: Border.all(color: Colors.black, width: 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   n.toString(),
                      //   style: TextStyle(fontSize: 16, color: Colors.black),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     AnimateIcon();
                      //   },
                      //   child: AnimatedIcon(
                      //     icon: AnimatedIcons.play_pause,
                      //     progress: iconController,
                      //     size: 50,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      Text(
                        que[n].que,
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                que[n].ansType == 'bool'
                    ? n != 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ignore: deprecated_member_use
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                ),
                                color: Color(0xFF26d3ba),
                                onPressed: () => check(true, null, null, ctx),
                              ),
                              // ignore: deprecated_member_use
                              RaisedButton(
                                onPressed: () => check(false, null, null, ctx),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                child: Icon(Icons.close),
                                color: Colors.red.shade400,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ignore: deprecated_member_use
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Icon(Icons.play_arrow),
                                    Text('< 38'),
                                  ],
                                ),
                                color: Color(0xFF26d3ba),
                                onPressed: () => check(true, null, null, ctx),
                              ),
                              // ignore: deprecated_member_use
                              RaisedButton(
                                onPressed: () => check(false, null, null, ctx),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                child: Row(
                                  children: [
                                    Icon(Icons.play_arrow),
                                    Text('>= 38'),
                                  ],
                                ),
                                color: Colors.red.shade400,
                              ),
                            ],
                          )
                    : que[n].ansType == 'int'
                        ? Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1.6,
                              children: <Widget>[
                                imageChoice(
                                  imag: 'assets/numbers/1.jpg',
                                  press: () => check(null, null, 1, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/2.jpg',
                                  press: () => check(null, null, 2, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/3.jpg',
                                  press: () => check(null, null, 3, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/4.jpg',
                                  press: () => check(null, null, 4, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/5.jpg',
                                  press: () => check(null, null, 5, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/6plus.jpg',
                                  press: () => check(null, null, 6, ctx),
                                ),
                                // imageChoice(
                                //   imag: 'assets/numbers/7.jpg',
                                //   press: () {
                                //     setState(() {
                                //       que[n].ans3 == 1;
                                //     });
                                //   },
                                // ),
                                // imageChoice(
                                //   imag: 'assets/numbers/8.jpg',
                                //   press: () {
                                //     setState(() {
                                //       que[n].ans3 == 1;
                                //     });
                                //   },
                                // ),
                                // imageChoice(
                                //   imag: 'assets/numbers/9.jpg',
                                //   press: () {
                                //     setState(() {
                                //       que[n].ans3 == 1;
                                //     });
                                //   },
                                // ),
                                // imageChoice(
                                //   imag: 'assets/numbers/10.jpg',
                                //   press: () {
                                //     setState(() {
                                //       que[n].ans3 == 1;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              stringChoice(
                                choice: "قبل من العلاج الكيميائي",
                                press: () => check(null, 'Anticipé', null, ctx),
                              ),
                              stringChoice(
                                choice: "أول 24 ساعة",
                                press: () => check(null, 'Aigue', null, ctx),
                              ),
                              stringChoice(
                                choice: "من ورا العلاج الكيميائي بنهار",
                                press: () => check(null, 'retardés', null, ctx),
                              ),
                              stringChoice(
                                choice: "مستمر واخا دوزتي العلاج مزيان",
                                press: () =>
                                    check(null, 'réfractaires', null, ctx),
                              ),
                            ],
                          ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void AnimateIcon() {
  //   setState(() {
  //     isAnimated = !isAnimated;

  //     if (isAnimated) {
  //       iconController.forward();
  //       audioPlayer.play();
  //     } else {
  //       iconController.reverse();
  //       audioPlayer.pause();
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   iconController.dispose();
  //   audioPlayer.dispose();
  //   super.dispose();
  // }
}

class stringChoice extends StatelessWidget {
  String choice;
  VoidCallback press;
  stringChoice({Key key, @required this.choice, @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 218, 218, 218),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    //=> speak(),
                    icon: Icon(Icons.play_arrow_rounded),
                    color: Colors.black,
                    iconSize: 20,
                  ),
                ),
              ),
              title: Row(
                children: [
                  Text(
                    choice,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontFamily: "DMSans"),
                  ),
                  Spacer(),
                  // Image.asset(
                  //   imag,
                  //   width: 90,
                  // ),
                ],
              ),
              onTap: press),
        ));
  }
}

class imageChoice extends StatelessWidget {
  String imag;
  VoidCallback press;
  imageChoice({Key key, @required this.imag, @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: press,
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              imag,
              width: 60,
              // width: 110.0, height: 110.0
            ),
          ),
        ),
      ),
    );
  }
}

class questions {
  final String que;
  final String imgurl;
  final String ansType;
  bool ans1;
  String ans2;
  int ans3;

  questions(
      this.que, this.imgurl, this.ansType, this.ans1, this.ans2, this.ans3);
}

class Home2 extends StatefulWidget {
  @override
  _HomeState2 createState() => _HomeState2();
}

class _HomeState2 extends State<Home2> {
  var n = 0;
  var score = 0;
  List que = [
    questions(" شحال من مرة كتجيك فالنهار؟", null, "int", null, "", null),
    questions(
        " كتجيك بنزيف هضمي؟", "assets/images/sick.png", "bool", true, "", null),
    questions("امتا بانت هاد الأعراض؟", "assets/images/schedule.png", "date",
        null, "", null),
    questions("كيفاش كتجيك؟", null, "string", null, "", null),
    questions("كتحس بالعيا بزاف؟", null, "bool", true, "", null),
    questions(" كتجيك بآلام البطن؟", null, "bool", true, "", null),
    questions("كتجيك مابين الماكلة؟", null, "bool", null, "", null),
    questions("كتحس بحلقك ناشف؟", "assets/images/no-water.png", "bool", true,
        "", null),
    questions(" كتعاني من سوء التغذية؟", "assets/images/poor.png", "bool", true,
        "", null),
    questions(
        "كتحس باضطراب عصبي؟", "assets/images/pain.png", "bool", true, "", null),
    questions(
        " فيك السخانة؟", "assets/images/sick.png", "bool", true, "", null),
    questions("واش البول ولا غامق ولا قليل؟", "assets/images/dark-urine.png",
        "bool", true, "", null),
  ];
  String _toString(int n) {
    if (que[n].ans1) {
      return '1';
    } else {
      return '0';
    }
  }

  Future<String> addData() async {
    //String myUrl = "http://192.168.34.87:8000/api/etatgeneral";
    String myUrl = 'diarrhees';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      "nbSellesParJr": que[0].ans3.toString(),
      "saignementDigestif": _toString(1),
      "dureeDeServeunu":
          que[2].ans2 != null ? que[2].ans2 : DateTime.now().toString(),
      "AspectSelles": que[3].ans2,
      "fatigue": _toString(4),
      "douleurAbdominal": _toString(5),
      "entreLesRepas": _toString(6),
      "Déshydratation": _toString(7),
      "Dénutrition": _toString(8),
      "troubleNeurologique": _toString(9),
      "fievre": _toString(10),
      "urinerPlusFoncerEtmoinsFrequente": _toString(11)
    }).then((response) {
      var body = json.decode(response.body);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
                  grade: body['diarrhee grade'],
                  symp: body['Symptom'].toString(),
                  tox: body['tox'].toString()))));
    });
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void check(bool choice, String choice2, int choice3, BuildContext ctx) {
    setState(
      () {
        que[n].ans1 = choice;
        que[n].ans2 = choice2;
        que[n].ans3 = choice3;
        print(que[n].ans1);
        print(que[n].ans2);
        print(que[n].ans3);
        if (n < que.length - 1) {
          n = n + 1;
        } else {
          addData();
          //Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: ((context) => Directionality(
          //           textDirection: TextDirection.rtl,
          //           child: FutureBuilder<String>(builder: (context, snapshot) {
          //             String data = snapshot.data;
          //             return Result(grade: '${data}');
          //           })))),
          // );
        }
      },
    );
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)

  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  //AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // iconController = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 1000));

    // audioPlayer.open(
    //   const Audio('assets/sound/Recording.m4a'),
    //   autoStart: false,
    //   //showNotification: true
    // );
  }

  DateTime selectedDate1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/icons/x.png',
                          ),
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Test())),
                      ),
                    )
                    // Text(
                    //   "",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: "DMSans",
                    //       fontSize: 20),
                    // ),
                    // Text(
                    //   " الحالة العامة",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: "DMSans",
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                    // Text(
                    //   " False",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                  ],
                ),
              ),
              elevation: 0,
              centerTitle: false,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Builder(
            builder: (ctx) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(40),
                    // child: ClipRRect(
                    //     borderRadius:
                    //         BorderRadius.vertical(top: Radius.circular(50)),
                    child: que[n].imgurl != null
                        ? Image.asset(
                            que[n].imgurl,
                            width: 100,
                          )
                        : Container()),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 105.0,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.vertical(bottom: Radius.circular(50)),
                  //     border: Border.all(color: Colors.black, width: 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   n.toString(),
                      //   style: TextStyle(fontSize: 16, color: Colors.black),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     AnimateIcon();
                      //   },
                      //   child: AnimatedIcon(
                      //     icon: AnimatedIcons.play_pause,
                      //     progress: iconController,
                      //     size: 50,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      Text(
                        que[n].que,
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                que[n].ansType == 'bool'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              Icons.check,
                              color: Colors.black,
                            ),
                            color: Color(0xFF26d3ba),
                            onPressed: () => check(true, null, null, ctx),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            onPressed: () => check(false, null, null, ctx),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(Icons.close),
                            color: Colors.red.shade400,
                          ),
                        ],
                      )
                    // : Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       // ignore: deprecated_member_use
                    //       RaisedButton(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(25)),
                    //         child: Row(
                    //           children: [
                    //             Icon(Icons.play_arrow),
                    //             Text('< 38'),
                    //           ],
                    //         ),
                    //         color: Color(0xFF26d3ba),
                    //         onPressed: () => check(true, null, null, ctx),
                    //       ),
                    //       // ignore: deprecated_member_use
                    //       RaisedButton(
                    //         onPressed: () => check(false, null, null, ctx),
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(40)),
                    //         child: Row(
                    //           children: [
                    //             Icon(Icons.play_arrow),
                    //             Text('>= 38'),
                    //           ],
                    //         ),
                    //         color: Colors.red.shade400,
                    //       ),
                    //     ],
                    //   )
                    : que[n].ansType == 'int'
                        ? Expanded(
                            child: GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: 1.6,
                              children: <Widget>[
                                imageChoice(
                                  imag: 'assets/numbers/1.jpg',
                                  press: () => check(null, null, 1, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/2.jpg',
                                  press: () => check(null, null, 2, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/3.jpg',
                                  press: () => check(null, null, 3, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/4.jpg',
                                  press: () => check(null, null, 4, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/5.jpg',
                                  press: () => check(null, null, 5, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/6.jpg',
                                  press: () => check(null, null, 6, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/7.jpg',
                                  press: () => check(null, null, 7, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/8.jpg',
                                  press: () => check(null, null, 8, ctx),
                                ),
                                imageChoice(
                                  imag: 'assets/numbers/9.jpg',
                                  press: () => check(null, null, 8, ctx),
                                ),
                                // imageChoice(
                                //   imag: 'assets/numbers/10.jpg',
                                //   press: () {
                                //     setState(() {
                                //       que[n].ans3 == 1;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                          )
                        : que[n].ansType == "date"
                            ? Column(
                                children: [
                                  DateTimeField(
                                      decoration: const InputDecoration(
                                          hintText: ' دخل نهار لي بانت فيه!'),
                                      selectedDate: selectedDate1,
                                      onDateSelected: (DateTime value) {
                                        setState(() {
                                          selectedDate1 = value;
                                          print(value);
                                        });
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        IconButton(
                                          icon: Icon(
                                            Icons.check_box,
                                            size: 45,
                                            color: Color(0xFF26d3ba),
                                          ),
                                          onPressed: () => check(
                                              null,
                                              selectedDate1.toString(),
                                              null,
                                              ctx),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Expanded(
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1.6,
                                  children: <Widget>[
                                    imageChoice(
                                      imag: "assets/images/poop.png",
                                      press: () =>
                                          check(null, "liquidienne", null, ctx),
                                    ),
                                    imageChoice(
                                      imag: "assets/images/mucus.png",
                                      press: () =>
                                          check(null, "glaireuse", null, ctx),
                                    ),
                                    imageChoice(
                                      imag: "assets/images/blood-drop.png",
                                      press: () => check(
                                          null, "glairo-sanglante", null, ctx),
                                    ),
                                  ],
                                ),
                              ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Home3 extends StatefulWidget {
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  var n = 0;
  var score = 0;
  List que = [
    questions(" شحال من مرة كتجيك ؟", null, "string", null, "", null),
    questions(
        "كتجيك بالوجع؟", "assets/images/pain.png", "bool", true, "", null),
    questions(" كتجيك بنزيف هضمي؟", "assets/images/intestine.png", "bool", true,
        "", null),
    questions(
        "كتجيك بالتقيؤ؟", "assets/images/vomiting.png", "bool", true, "", null),
    questions(
        " فيك السخانة؟", "assets/images/sick.png", "bool", true, "", null),
    questions("امتا بانت هاد الأعراض؟", "assets/images/schedule.png", "date",
        null, "", null),
  ];
  String _toString(int n) {
    if (que[n].ans1) {
      return '1';
    } else {
      return '0';
    }
  }

  Future<String> addData() async {
    //String myUrl = "http://192.168.34.87:8000/api/etatgeneral";
    String myUrl = 'consipations';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      "frequenceSelles": que[0].ans2,
      "douleurEtCrampe": _toString(1),
      "saignementDigestif": _toString(2),
      "vomissement": _toString(3),
      "fievre": _toString(4),
      "apparition": que[5].ans2
    }).then((response) {
      var body = json.decode(response.body);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
                    grade: body['constipation grade'],
                    symp: body['Symptom'].toString(),
                    tox: body['tox'].toString(),
                  ))));
    });
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void check(bool choice, String choice2, int choice3, BuildContext ctx) {
    setState(
      () {
        que[n].ans1 = choice;
        que[n].ans2 = choice2;
        que[n].ans3 = choice3;
        print(que[n].ans1);
        print(que[n].ans2);
        print(que[n].ans3);
        if (n < que.length - 1) {
          n = n + 1;
        } else {
          addData();
          //Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: ((context) => Directionality(
          //           textDirection: TextDirection.rtl,
          //           child: FutureBuilder<String>(builder: (context, snapshot) {
          //             String data = snapshot.data;
          //             return Result(grade: '${data}');
          //           })))),
          // );
        }
      },
    );
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)

  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  //AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // iconController = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 1000));

    // audioPlayer.open(
    //   const Audio('assets/sound/Recording.m4a'),
    //   autoStart: false,
    //   //showNotification: true
    // );
  }

  DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/icons/x.png',
                          ),
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Test())),
                      ),
                    )
                    // Text(
                    //   "",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: "DMSans",
                    //       fontSize: 20),
                    // ),
                    // Text(
                    //   " الحالة العامة",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: "DMSans",
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                    // Text(
                    //   " False",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                  ],
                ),
              ),
              elevation: 0,
              centerTitle: false,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Builder(
            builder: (ctx) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(40),
                    // child: ClipRRect(
                    //     borderRadius:
                    //         BorderRadius.vertical(top: Radius.circular(50)),
                    child: que[n].imgurl != null
                        ? Image.asset(
                            que[n].imgurl,
                            width: 100,
                          )
                        : Container()),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 105.0,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.vertical(bottom: Radius.circular(50)),
                  //     border: Border.all(color: Colors.black, width: 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   n.toString(),
                      //   style: TextStyle(fontSize: 16, color: Colors.black),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     AnimateIcon();
                      //   },
                      //   child: AnimatedIcon(
                      //     icon: AnimatedIcons.play_pause,
                      //     progress: iconController,
                      //     size: 50,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      Text(
                        que[n].que,
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                que[n].ansType == 'bool'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              Icons.check,
                              color: Colors.black,
                            ),
                            color: Color(0xFF26d3ba),
                            onPressed: () => check(true, null, null, ctx),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            onPressed: () => check(false, null, null, ctx),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(Icons.close),
                            color: Colors.red.shade400,
                          ),
                        ],
                      )
                    : que[n].ansType == "date"
                        ? Column(
                            children: [
                              DateTimeField(
                                  decoration: const InputDecoration(
                                      hintText: ' دخل نهار لي بانت فيه!'),
                                  selectedDate: selectedDate,
                                  onDateSelected: (DateTime value) {
                                    setState(() {
                                      selectedDate = value;
                                      print(value);
                                    });
                                  }),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                        Icons.check_box,
                                        size: 45,
                                        color: Color(0xFF26d3ba),
                                      ),
                                      onPressed: () => check(null,
                                          selectedDate.toString(), null, ctx),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              stringChoice(
                                choice: " محبساتش كتر من 3 يوم ",
                                press: () =>
                                    check(null, 'persistante', null, ctx),
                              ),
                              stringChoice(
                                choice: "مرة مرة",
                                press: () =>
                                    check(null, 'occasionnelle', null, ctx),
                              ),
                            ],
                          ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Home4 extends StatefulWidget {
  @override
  _Home4State createState() => _Home4State();
}

class _Home4State extends State<Home4> {
  var n = 0;
  var score = 0;
  List que = [
    questions("امتا بانت هاد الأعراض؟", null, "string", null, "", null),
    questions(
        "كتجيك بالوجع؟", "assets/images/pain.png", "bool", true, "", null),
    questions("كي ولات الماكلة ديالك؟", "assets/images/diet.png", "string",
        null, "", null),
    questions("كي ولا الصوت ديالك؟", "assets/images/voice.png", "string", null,
        "", null),
    questions("فاش كتسرط الماكلة :", "assets/images/binge-eating.png", "string",
        null, "", null),
    questions("كي ولا لسان ديالك؟", "assets/images/mouth.png", "string", null,
        "", null),
    questions("كي ولا اللعاب ديالك؟", "assets/images/saliva.png", "string",
        null, "", null),
    questions("كي ولاو الأغشية المخاطية ديالك؟", "assets/images/muqueus.jpg",
        "string", null, "", null),
    questions("كي ولات اللثة ديالك؟", "assets/images/gencive2.jpg", "string",
        null, "", null),
    questions("كيف ديرين سنانك ديالك؟", "assets/images/clean.png", "string",
        null, "", null),
    questions("كيف دير الفم ديالك؟", "assets/images/lips.png", "string", null,
        "", null),
  ];
  String _toString(int n) {
    if (que[n].ans1) {
      return '1';
    } else {
      return '0';
    }
  }

  Future<String> addData() async {
    //String myUrl = "http://192.168.34.87:8000/api/etatgeneral";
    String myUrl = 'mucite';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      "momentApparition": que[0].ans2,
      "douleur": _toString(1),
      "priseAlimentaire": que[2].ans2,
      "voix": que[3].ans2,
      "deglutition": que[4].ans2,
      "langue": que[5].ans2,
      "salive": que[6].ans2,
      "muqueuse": que[7].ans2,
      "gencive": que[8].ans2,
      "dents": que[9].ans2,
      "levres": que[10].ans2
    }).then((response) {
      var body = json.decode(response.body);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
                    grade: body['mucite grade'],
                    symp: body['Symptom'].toString(),
                    tox: body['tox'].toString(),
                  ))));
    });
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void check(bool choice, String choice2, int choice3, BuildContext ctx) {
    setState(
      () {
        que[n].ans1 = choice;
        que[n].ans2 = choice2;
        que[n].ans3 = choice3;
        print(que[n].ans1);
        print(que[n].ans2);
        print(que[n].ans3);
        if (n < que.length - 1) {
          n = n + 1;
        } else {
          addData();
          //Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: ((context) => Directionality(
          //           textDirection: TextDirection.rtl,
          //           child: FutureBuilder<String>(builder: (context, snapshot) {
          //             String data = snapshot.data;
          //             return Result(grade: '${data}');
          //           })))),
          // );
        }
      },
    );
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)

  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  //AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // iconController = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 1000));

    // audioPlayer.open(
    //   const Audio('assets/sound/Recording.m4a'),
    //   autoStart: false,
    //   //showNotification: true
    // );
  }

  DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/icons/x.png',
                          ),
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Test())),
                      ),
                    )
                    // Text(
                    //   "",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: "DMSans",
                    //       fontSize: 20),
                    // ),
                    // Text(
                    //   " الحالة العامة",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: "DMSans",
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                    // Text(
                    //   " False",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                  ],
                ),
              ),
              elevation: 0,
              centerTitle: false,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Builder(
            builder: (ctx) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(40),
                    // child: ClipRRect(
                    //     borderRadius:
                    //         BorderRadius.vertical(top: Radius.circular(50)),
                    child: que[n].imgurl != null
                        ? Image.asset(
                            que[n].imgurl,
                            width: 100,
                          )
                        : Container()),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 105.0,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.vertical(bottom: Radius.circular(50)),
                  //     border: Border.all(color: Colors.black, width: 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   n.toString(),
                      //   style: TextStyle(fontSize: 16, color: Colors.black),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     AnimateIcon();
                      //   },
                      //   child: AnimatedIcon(
                      //     icon: AnimatedIcons.play_pause,
                      //     progress: iconController,
                      //     size: 50,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      Text(
                        que[n].que,
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                que[n].ansType == 'bool'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              Icons.check,
                              color: Colors.black,
                            ),
                            color: Color(0xFF26d3ba),
                            onPressed: () => check(true, null, null, ctx),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            onPressed: () => check(false, null, null, ctx),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(Icons.close),
                            color: Colors.red.shade400,
                          ),
                        ],
                      )
                    : n == 0
                        ? Column(
                            children: [
                              stringChoice(
                                choice: "قبل من العلاج الكيميائي",
                                press: () => check(null, 'Anticipé', null, ctx),
                              ),
                              stringChoice(
                                choice: "أول 24 ساعة",
                                press: () => check(null, 'Aigue', null, ctx),
                              ),
                              stringChoice(
                                choice: "من ورا العلاج الكيميائي بنهار",
                                press: () => check(null, 'retardés', null, ctx),
                              ),
                              stringChoice(
                                choice: "مستمر واخا دوزتي العلاج مزيان",
                                press: () =>
                                    check(null, 'réfractaires', null, ctx),
                              ),
                            ],
                          )
                        : n == 2
                            ? Column(
                                children: [
                                  stringChoice(
                                    choice: "عادية",
                                    press: () =>
                                        check(null, 'normale', null, ctx),
                                  ),
                                  stringChoice(
                                    choice: "تبدلات",
                                    press: () =>
                                        check(null, 'modifiee', null, ctx),
                                  ),
                                  stringChoice(
                                    choice: "مكنقدرش ناكل ",
                                    press: () =>
                                        check(null, 'impossible', null, ctx),
                                  ),
                                ],
                              )
                            : n == 3
                                ? Column(
                                    children: [
                                      stringChoice(
                                        choice: " عادي",
                                        press: () =>
                                            check(null, 'normale', null, ctx),
                                      ),
                                      stringChoice(
                                        choice: "باح ولا ناشف",
                                        press: () => check(
                                            null, 'seche/rauque', null, ctx),
                                      ),
                                      stringChoice(
                                        choice: "صعيب ندوي ",
                                        press: () => check(
                                            null, 'impossible', null, ctx),
                                      ),
                                    ],
                                  )
                                : n == 4
                                    ? Column(
                                        children: [
                                          stringChoice(
                                            choice: " كتسرطها عادي",
                                            press: () => check(
                                                null, 'normale', null, ctx),
                                          ),
                                          stringChoice(
                                            choice: "كدرك",
                                            press: () => check(
                                                null, 'douloureuse', null, ctx),
                                          ),
                                          stringChoice(
                                            choice: "مكنقدرش نسرطها ",
                                            press: () => check(
                                                null, 'impossible', null, ctx),
                                          ),
                                        ],
                                      )
                                    : n == 5
                                        ? Column(
                                            children: [
                                              stringChoice(
                                                choice: "غوز او ماناشفش",
                                                press: () => check(null,
                                                    'rose&humide', null, ctx),
                                              ),
                                              stringChoice(
                                                choice: " شاحب و لزج",
                                                press: () => check(null,
                                                    'pateuse&pale', null, ctx),
                                              ),
                                              stringChoice(
                                                choice: "مشقق",
                                                press: () => check(null,
                                                    'fissuree', null, ctx),
                                              ),
                                            ],
                                          )
                                        : n == 6
                                            ? Column(
                                                children: [
                                                  stringChoice(
                                                    choice: "شفاف",
                                                    press: () => check(
                                                        null,
                                                        'transparente',
                                                        null,
                                                        ctx),
                                                  ),
                                                  stringChoice(
                                                    choice: "تقيل و لزج",
                                                    press: () => check(
                                                        null,
                                                        'epaisse&visqueuse',
                                                        null,
                                                        ctx),
                                                  ),
                                                  stringChoice(
                                                    choice: "مكينش",
                                                    press: () => check(null,
                                                        'absente', null, ctx),
                                                  ),
                                                ],
                                              )
                                            : n == 7
                                                ? Column(
                                                    children: [
                                                      stringChoice(
                                                        choice:
                                                            "غوز او ماناشفش",
                                                        press: () => check(
                                                            null,
                                                            'rose&humide',
                                                            null,
                                                            ctx),
                                                      ),
                                                      stringChoice(
                                                        choice: "ملتهب",
                                                        press: () => check(
                                                            null,
                                                            'inflammation',
                                                            null,
                                                            ctx),
                                                      ),
                                                      stringChoice(
                                                        choice: "تقرح / نزيف",
                                                        press: () => check(
                                                            null,
                                                            'Ulcération/saignement ',
                                                            null,
                                                            ctx),
                                                      ),
                                                    ],
                                                  )
                                                : n == 8
                                                    ? Column(
                                                        children: [
                                                          stringChoice(
                                                            choice:
                                                                "غوز او تابثة",
                                                            press: () => check(
                                                                null,
                                                                'rose&ferme',
                                                                null,
                                                                ctx),
                                                          ),
                                                          stringChoice(
                                                            choice:
                                                                "ملتهبة و منفوخة",
                                                            press: () => check(
                                                                null,
                                                                'inflammatoire&oedeme',
                                                                null,
                                                                ctx),
                                                          ),
                                                          stringChoice(
                                                            choice: "نزيف",
                                                            press: () => check(
                                                                null,
                                                                'Saignement spontané',
                                                                null,
                                                                ctx),
                                                          ),
                                                        ],
                                                      )
                                                    : n == 9
                                                        ? Column(
                                                            children: [
                                                              stringChoice(
                                                                choice: "نقيين",
                                                                press: () =>
                                                                    check(
                                                                        null,
                                                                        'propre',
                                                                        null,
                                                                        ctx),
                                                              ),
                                                              stringChoice(
                                                                choice:
                                                                    " فيهم الجير ",
                                                                press: () => check(
                                                                    null,
                                                                    'plaques localisees',
                                                                    null,
                                                                    ctx),
                                                              ),
                                                              stringChoice(
                                                                choice:
                                                                    " فيهم الجير و كيطيحو ",
                                                                press: () => check(
                                                                    null,
                                                                    'Plaques et débris généralisées',
                                                                    null,
                                                                    ctx),
                                                              ),
                                                            ],
                                                          )
                                                        : Column(
                                                            children: [
                                                              stringChoice(
                                                                choice:
                                                                    " غوز و رطبين",
                                                                press: () => check(
                                                                    null,
                                                                    'rose&lise',
                                                                    null,
                                                                    ctx),
                                                              ),
                                                              stringChoice(
                                                                choice:
                                                                    "ناشفين و كيتشقو",
                                                                press: () => check(
                                                                    null,
                                                                    'seche&fissure',
                                                                    null,
                                                                    ctx),
                                                              ),
                                                              stringChoice(
                                                                choice:
                                                                    "تقرح / نزيف",
                                                                press: () => check(
                                                                    null,
                                                                    'Ulcérations, saignements',
                                                                    null,
                                                                    ctx),
                                                              ),
                                                            ],
                                                          ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

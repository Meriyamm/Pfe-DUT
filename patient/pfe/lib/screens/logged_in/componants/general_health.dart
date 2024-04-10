import 'dart:convert';
//import 'package:assets_audio_player/assets_audio_player.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pfe/api/login_api.dart';
import 'package:pfe/screens/anonyme/componants/nav_bar.dart';
import 'package:pfe/screens/logged_in/logged_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

//void main() => runApp(GeneralHealth());

class GeneralHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(textDirection: TextDirection.rtl, child: Home()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var n = 0;
  var score = 0;
  List que = [
    questions("كتحس بالراحة فالذات؟", "assets/images/plaintes.jpeg", true),
    questions("كتحس بالعيا؟", "assets/images/fatigue.jpg", true),
    questions("كتقد على الخدمة / القراية؟", "assets/images/work.jpeg", true),
    questions(
        "كتقد على شْغالْ الدّار, شْغالْ العائٍلة, شْغالْ الْفراغْ, الصّلاة؟ ",
        "assets/images/quot1.jpg",
        true),
    questions(
        "تقْدّ براسْكْ وْ تقادّ حاْلتكْ؟", "assets/images/auto1.jpeg", true),
    questions("كتحس بالحريق / الصداع؟", "assets/images/pain1.jpeg", true),
    questions(" كتحس بالقلق، الاكتٍئاب؟", "assets/images/anx+dep.png", true),
  ];
  String _toString(int n) {
    if (que[n].ans) {
      return '1';
    } else {
      return '0';
    }
  }

  void addData() async {
    //String myUrl = "http://192.168.34.87:8000/api/etatgeneral";
    String myUrl = 'etatgenerals';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      'presencePlaintes': _toString(0),
      'fatigue': _toString(1),
      'capaciteTravaille': _toString(2),
      'activiterQuotidiennes': _toString(3),
      'autonomie': _toString(4),
      'douleur': _toString(5),
      'anxietyDepression': _toString(6)
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
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

  void check(bool choice, BuildContext ctx) {
    // if (choice != true) {
    //   // score = score + 1;
    //   // final snackbar = SnackBar(
    //   //   content: Text('Correct Answer'),
    //   //   duration: Duration(milliseconds: 500),
    //   //   backgroundColor: Colors.green,
    //   // );
    //   // // ignore: deprecated_member_use
    //   // Scaffold.of(ctx).showSnackBar(snackbar);
    //   setState(() {
    //     que[n].ans = choice;
    //   });
    // } else {
    //   final snackbar = SnackBar(
    //     content: Text('Wrong Answer'),
    //     duration: Duration(milliseconds: 500),
    //     backgroundColor: Colors.red,
    //   );
    //   // ignore: deprecated_member_use
    //   Scaffold.of(ctx).showSnackBar(snackbar);
    // }
    // que[n].ans == choice;
    // // if (choice == que[n].ans) {
    // //   que[n].ans == false;
    // // } else {
    // //   que[n].ans == true;
    // // }

    setState(
      () {
        que[n].ans = choice;
        print(que[n].ans);
        if (n < que.length - 1) {
          n = n + 1;
        } else {
          addData();
          //Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Directionality(
                      textDirection: TextDirection.rtl, child: LoggedIn()))));
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

    iconController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

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
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 241, 241, 241),
              title: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " تقييم ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "DMSans",
                          fontSize: 20),
                    ),
                    Text(
                      " الحالة العامة",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "DMSans",
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
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
              centerTitle: true,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Builder(
            builder: (ctx) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(15),
                    // child: ClipRRect(
                    //     borderRadius:
                    //         BorderRadius.vertical(top: Radius.circular(50)),
                    child: Image.asset(que[n].imgurl)),
                //SizedBox(height: 15,),
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
                Row(
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
                      onPressed: () => check(true, ctx),
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () => check(false, ctx),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Icon(Icons.close),
                      color: Colors.red.shade400,
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 25, right: 25),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Score: $score/5",
                //         style: TextStyle(
                //             color: Colors.blue.shade800,
                //             fontSize: 18,
                //             fontWeight: FontWeight.w800),
                //       ),
                //       InkWell(
                //           onTap: () => addData(),
                //           // => _register(),
                //           child: Text(
                //             "Reset",
                //             style: TextStyle(
                //                 color: Colors.blue.shade800,
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w800),
                //           ))
                //     ],
                //   ),
                // ),
                // n >= que.length - 1
                //     ? Padding(
                //         padding: const EdgeInsets.symmetric(
                //           horizontal: 25,
                //           vertical: 10,
                //         ),
                //         child: SizedBox(
                //           width: double.infinity,
                //           child: RaisedButton(
                //             color: Color(0xFF26d3ba),
                //             child: Text(
                //               "Start",
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontFamily: "DMSans",
                //                 fontSize: 18,
                //               ),
                //             ),
                //             onPressed: () {
                //               addData();
                //               // print(
                //               //     "Delete List Lenght: ${selectedSymp.length}");
                //             },
                //           ),
                //         ),
                //       )
                //     : Container(),
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

class questions {
  final String que;
  final String imgurl;
  bool ans;

  questions(this.que, this.imgurl, this.ans);
}

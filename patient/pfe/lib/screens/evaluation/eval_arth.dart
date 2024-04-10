import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pfe/screens/evaluation/result.dart';
import 'package:pfe/screens/logged_in/componants/test_arth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/login_api.dart';
import '../logged_in/test.dart';

class EvalArth extends StatelessWidget {
  const EvalArth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var n = 0;
  var score = 0;
  List que = [
    questions("واش كضرك هاد البلاصا؟", "assets/images/hips.jpg", "bool", true,
        "", null),
    questions("واش كضرك هاد البلاصا؟", "assets/images/shoulder.jpg", "bool",
        true, "", null),
    questions("واش كضرك هاد البلاصا؟", "assets/images/mem.jpg", "bool", true,
        "", null),
    questions("كتحس بتشنجات عضلية فدوك لبلايص؟", null, "bool", true, "", null),
    questions("كتحس ألم منتشر فدوك لبلايص؟", null, "bool", true, "", null),
    questions("كتحس بألم مفصلي فدوك لبلايص؟", null, "bool", true, "", null),
  ];
  String _toString(int n) {
    if (que[n].ans1) {
      return '1';
    } else {
      return '0';
    }
  }

  Future<String> addData() async {
    String myUrl = 'arth';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      "hanches": _toString(0),
      "epaules": _toString(1),
      "membres": _toString(2),
      "crampesMusculaires": _toString(3),
      "douleurDiffuses": _toString(4),
      "arthralgies": _toString(5),
    }).then((response) {
      var body = json.decode(response.body);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
                    grade: body['grade'],
                    symp: body['tox'].toString(),
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

  @override
  void initState() {
    super.initState();
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
                        onPressed: () => Navigator.pop(context,
                            MaterialPageRoute(builder: (context) => Test())),
                      ),
                    )
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
                    margin: EdgeInsets.all(50),
                    child: que[n].imgurl != null
                        ? Image.asset(
                            que[n].imgurl,
                            width: 220,
                          )
                        : Container()),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 105.0,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pfe/screens/evaluation/result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../api/login_api.dart';
import '../logged_in/test.dart';

class EvalGon extends StatelessWidget {
  final int id;
  const EvalGon({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: id == 0 ? Home1() : Home2(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home1 extends StatefulWidget {
  const Home1({Key key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  var n = 0;
  var score = 0;
  List que = [
    questions("هل دورتك غير منتظمة؟", "assets/images/period.jpeg", "bool", true,
        "", null),
    questions("هل تم تغيير معدل أو مقدار دورتك؟", null, "bool", true, "", null),
    questions("هل توقفت دورتك؟", null, "bool", true, "", null),
    questions(
        "كتحس بالصهد بزاف؟", "assets/images/sick.png", "bool", true, "", null),
    questions("هل بشرتك وغشاءك المخاطي جافان؟", null, "bool", true, "", null),
  ];
  String _toString(int n) {
    if (que[n].ans1) {
      return '1';
    } else {
      return '0';
    }
  }

  Future<String> addData() async {
    String myUrl = 'perturb';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      "irregulariteDuCycle": _toString(0),
      "modificationTotalDesRegles": _toString(1),
      "interruptionTotalDesRegles": _toString(2),
      "bouffeeDeChaleur": _toString(3),
      "secheressePeauMuquese": _toString(4),
    }).then((response) {
      var body = json.decode(response.body);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
                    grade: body['grade'],
                    symp: body['symp'].toString(),
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
                        onPressed: () => Navigator.push(context,
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
                    margin: EdgeInsets.all(40),
                    child: que[n].imgurl != null
                        ? Image.asset(
                            que[n].imgurl,
                            width: 200,
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

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var n = 0;
  var score = 0;
  List que = [
    questions("واش المنطقة الحساسة ديالك ناشفة؟", "assets/images/sechvag.png", "bool", true,
        "", null),
    questions("واش المنطقة الحساسة كتجيب ليك الحكة؟", "assets/images/demg.jpg", "bool", true, "", null),
    questions("كتحس بالانزعاج الحميمي؟", "assets/images/inco.jpeg", "bool", true, "", null),
    questions(
        " كتحس بعسر الجماع؟", "assets/images/dysp.png", "bool", true, "", null),
    questions("عندك تثدي؟", null, "bool", true, "", null),
  ];
  String _toString(int n) {
    if (que[n].ans1) {
      return '1';
    } else {
      return '0';
    }
  }

  Future<String> addData() async {
    String myUrl = 'sexuality';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      "secheresseVaginale": _toString(0),
      "DemangeaisonsGenitales": _toString(1),
      "InconfortIntime": _toString(2),
      "dyspareunie": _toString(3),
      "gynecomastie": _toString(4),
    }).then((response) {
      var body = json.decode(response.body);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
                    grade: body['grade'],
                    symp: body['symp'].toString(),
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
                        onPressed: () => Navigator.push(context,
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
                    margin: EdgeInsets.all(40),
                    child: que[n].imgurl != null
                        ? Image.asset(
                            que[n].imgurl,
                            width: 200,
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

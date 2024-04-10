import 'dart:convert';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:intl/intl.dart';
import 'package:pfe/screens/logged_in/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../api/login_api.dart';
import '../../evaluation/result.dart';

class BeginTest extends StatelessWidget {
  final int id;
  BeginTest({Key key, @required this.id}) : super(key: key);
  final List<String> images = <String>[
    'assets/images/visage.jpg',
    'assets/images/plis.jpg',
    'assets/images/region.jpg',
    'assets/images/mamaire.jpg',
    'assets/images/perinerale.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor:
                  const Color.fromARGB(255, 247, 247, 247)),
          home: Scaffold(
              body: Stack(children: <Widget>[
            /*Container(
                    height: size.height * .30,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xFF0f3c78),
                      Color(0xFF26d3ba)
                    ]))),*/
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/icons/x.png',
                          ),
                        ),
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Text(
                              id == 0
                                  ? 'ختار البلاصة لي بان فيها الطفح الجلدي!'
                                  : "",
                              style:
                                  const TextStyle(fontFamily: 'DMSans', fontSize: 16),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        alignment: Alignment.center,
                        child: id == 0
                            ? GridView.builder(
                                // padding: const EdgeInsets.all(6),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .75,
                                ),
                                itemCount: images.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                rash(id: index))),
                                    child: Container(
                                        height: 50,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(29.5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.23),
                                              spreadRadius: -4,
                                              blurRadius: 10,
                                              offset: const Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        //color: Colors.amber[colorCodes[index]],
                                        child: Center(
                                            child:
                                                Image.asset('${images[index]}'))
                                        //Text('Entry ${images[index]}')),
                                        ),
                                  );
                                },
                                // separatorBuilder: (BuildContext context, int index) =>
                                //     const Divider(),
                              )
                            : Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(30),
                                    child: Text(
                                      "Do you have a fever?",
                                      style: TextStyle(
                                          fontFamily: "DMSans", fontSize: 20),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            "assets/icons/like.png",
                                          )),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              "assets/icons/dislike.png"))
                                    ],
                                  )
                                ],
                              ),
                      ),
                    ))
                  ]),
            ))
          ]))),
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

class rash extends StatefulWidget {
  final int id;
  const rash({Key key, @required this.id}) : super(key: key);

  @override
  State<rash> createState() => _rashState();
}

class _rashState extends State<rash> {
  var n = 0;
  List que = [
    questions(
        " فيك السخانة؟", "assets/images/sick.png", "bool", true, null, null),
    questions("شحال تضررت المنطقة؟", null, 'int', null, null, null),
    questions(
        "كتجيك بالوجع؟", "assets/images/pain.png", "bool", true, null, null),
    questions("كدير ليك الحكة؟", null, 'bool', true, null, null),
    questions('كتحرقك؟', null, 'bool', true, null, null),
    // questions("امتا بانت هاد الأعراض؟", "assets/images/schedule.png", "date",
    //     null, "", null),
    questions(
        'واش كتأثر على  الأنشطة اليومية؟', null, 'bool', true, null, null),
    questions(
        'ختار الصورة لي كتمتل الحالة ديالك!', null, 'string', null, '', null)
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
    String myUrl = 'cutanees';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      "organe_id": (widget.id + 1).toString(),
      "SurfaceAtteinte": que[1].ans3.toString(),
      "douleur": _toString(2),
      "prurit": _toString(3),
      "fievre": _toString(0),
      "brulure": _toString(4),
      // "delaiApparution": que[5].ans2.toString(),
      "ImpactSurActivite": _toString(5),
      "surInfection": que[6].ans2
    }).then((response) {
      var body = json.decode(response.body);
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => Result(
                    grade: body['RashcutaneeGrade '],
                    symp: body['organe'].toString(),
                  ))));
    });
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
    DateTime selectedDate1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
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
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Builder(
              builder: (ctx) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(40),
                      // child: ClipRRect(
                      //     borderRadius:
                      //         BorderRadius.vertical(top: Radius.circular(50)),
                      child: que[n].imgurl != null
                          ? Image.asset(
                              que[n].imgurl,
                              width: 100,
                            )
                          : Container()),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
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
                          style: const TextStyle(fontSize: 25, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
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
                              child: const Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                              color: const Color(0xFF26d3ba),
                              onPressed: () => check(true, null, null, ctx),
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () => check(false, null, null, ctx),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: const Icon(Icons.close),
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
                                    selectedDate: selectedDate1,
                                    onDateSelected: (DateTime value) {
                                      setState(() {
                                        selectedDate1 = value;
                                        // print(DateFormat.yMMMd()
                                        //     .format(DateTime.now()));
                                        print(value);
                                      });
                                    }),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(
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
                          : que[n].ansType == 'int'
                              ? Column(
                                  children: [
                                    stringChoice(
                                      choice: "قل من 10٪ ",
                                      press: () => check(null, null, 1, ctx),
                                    ),
                                    stringChoice(
                                      choice: "ما بين 10 و 30٪",
                                      press: () => check(null, null, 2, ctx),
                                    ),
                                    stringChoice(
                                      choice: "كتر من 30٪",
                                      press: () => check(null, null, 3, ctx),
                                    ),
                                  ],
                                )
                              : Expanded(
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.6,
                                    children: <Widget>[
                                      imageChoice(
                                        imag: 'assets/images/rash1.png',
                                        press: () => check(null,
                                            'Dermatite simple', null, ctx),
                                      ),
                                      imageChoice(
                                        imag: 'assets/images/rash3.png',
                                        press: () => check(
                                            null,
                                            'Surinfection mycosique',
                                            null,
                                            ctx),
                                      ),
                                      imageChoice(
                                        imag: 'assets/images/rash2.png',
                                        press: () => check(
                                            null,
                                            'Surinfection bactérienne',
                                            null,
                                            ctx),
                                      ),
                                      imageChoice(
                                        imag: 'assets/icons/forbidden.png',
                                        press: () =>
                                            check(null, 'aucun', null, ctx),
                                      ),
                                    ],
                                  ),
                                ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
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
                icon: const Icon(Icons.play_arrow_rounded),
                color: Colors.black,
                iconSize: 20,
              ),
            ),
          ),
          title: Row(
            children: [
              Text(
                choice,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontFamily: "DMSans"),
              ),
              const Spacer(),
              // Image.asset(
              //   imag,
              //   width: 90,
              // ),
            ],
          ),
          onTap: press),
    );
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
              width: 150,
              // width: 110.0, height: 110.0
            ),
          ),
        ),
      ),
    );
  }
}

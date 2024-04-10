//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';

import 'package:pfe/api/login_api.dart';
import 'package:pfe/components/primary_buttons.dart';
import 'package:pfe/model/toxicity_model.dart';
import 'package:pfe/screens/logged_in/componants/test_dig.dart';
import 'package:pfe/screens/logged_in/componants/test_gon.dart';
import 'package:pfe/screens/logged_in/componants/test_ocu.dart';
import 'package:pfe/screens/logged_in/home_screen.dart';
import 'package:pfe/screens/logged_in/logged_in.dart';

import 'componants/test_Cut.dart';
import 'componants/test_arth.dart';
import 'componants/test_neur.dart';
import 'componants/test_neuro.dart';

Future<List<ToxicityInfo>> fetchData() async {
  var res = await CallApi().getData('toxicites');
  //print(res.body);

  //final response = await http.get('http://192.168.1.110:9000/api/welcomeinfo');
  if (res.statusCode == 200) {
    //List jsonResponse = json.decode(res.body);
    // Map<String, dynamic> jsonResponse = json.decode(res.body);
    // List map = jsonResponse['data'];
    // // print(map[0]['created_at']);

    // print(map);

    // return map.map((data) => new ToxicityInfo.fromJson(data)).toList();
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);
    return jsonResponse.map((data) => new ToxicityInfo.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  VoidCallback action;
  Future<List<ToxicityInfo>> futureData;
  FlutterTts flutterTts = FlutterTts();
  String question = "ختار سمية لي بغيتي تشخصها؟";
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  //List<Symptom> selectedSymptoms = List();
  final format = DateFormat("yyyy-MM-dd HH:mm");
  ////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    Future speak() async {
      await flutterTts.setLanguage("fr-FR");
      //print(await flutterTts.getLanguages);
      await flutterTts.speak(question);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(70),
        //   child: AppBar(
        //     backgroundColor: Color(0xFF26d3ba),
        //     title: Container(
        //       height: 50,
        //       margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        //       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(29.5),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.23),
        //             spreadRadius: -4,
        //             blurRadius: 10,
        //             offset: const Offset(0, 1), // changes position of shadow
        //           ),
        //         ],
        //       ),
        //       child: Directionality(
        //         textDirection: TextDirection.rtl,
        //         child: const TextField(
        //             decoration: InputDecoration(
        //           hintText: "بحث",
        //           hintStyle: TextStyle(fontFamily: "DMSans"),
        //           icon: Icon(
        //             Icons.search,
        //             color: Color(0xFF26d3ba),
        //           ),
        //           border: InputBorder.none,
        //         )),
        //       ),
        //     ),
        //   ),
        // ),
        body:
            // Padding(
            //   padding: const EdgeInsets.only(left: 50),
            //   child: Text(
            //     'Evaluation',
            //     style: Theme.of(context)
            //         .textTheme
            //         .headline5
            //         .copyWith(fontFamily: "DMSans"),
            //   ),
            // ),
            Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                          )),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoggedIn())),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            // DateTimeField(
            //   format: format,
            //   onShowPicker: (context, currentValue) async {
            //     final date = await showDatePicker(
            //         context: context,
            //         firstDate: DateTime(1900),
            //         initialDate: currentValue ?? DateTime.now(),
            //         lastDate: DateTime(2100));
            //     if (date != null) {
            //       final time = await showTimePicker(
            //         context: context,
            //         initialTime:
            //             TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            //       );
            //       return DateTimeField.combine(date, time);
            //     } else {
            //       return currentValue;
            //     }
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 44,
                        width: 44,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () => speak(),
                          icon: Icon(Icons.play_arrow_rounded),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: Text(
                        question,
                        style: const TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            fontFamily: "DMSans"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<ToxicityInfo>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ToxicityInfo> data = snapshot.data;
                    return GridView.builder(
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return SampleAvatar(
                            imag: data[index].img,
                            tox: data[index].name,
                            press: () async {
                              if (data[index].id == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestDig()));
                              } else if (data[index].id == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestCut()));
                              } else if (data[index].id == 4) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestNeur()));
                              } else if (data[index].id == 6) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestOcu()));
                              } else if (data[index].id == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestGon()));
                              } else if (data[index].id == 5) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestArth()));
                              }else if (data[index].id == 7) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestNeuro()));
                              }
                            },
                          );
                        });
                  } else if (snapshot.hasError) {
                    //return Text("Error");
                    return Text(snapshot.error.toString());
                  }
                  return Text('');
                  //     CircularProgressIndicator(
                  //   color: Color(0xFF26d3ba),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
      // Expanded(
      //   child: FutureBuilder<List<ToxicityInfo>>(
      //     future: futureData,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         List<ToxicityInfo> data = snapshot.data;
      //         return GridView.builder(
      //             itemCount: snapshot.data.length,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               childAspectRatio: 1.2,
      //             ),
      //             itemBuilder: (BuildContext context, int index) {
      //               return SampleAvatar(
      //                 imag: data[index].img,
      //                 tox: data[index].name,
      //                 press: () => Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => TestDig())),
      //               );
      //             });
      //       } else if (snapshot.hasError) {
      //         return Text("Error");
      //       }
      //       return Text('...');
      //       // CircularProgressIndicator(
      //       //   color: Color(0xFF26d3ba),
      //       // );
      //     },
      //   ),
      // )

      //   GridView.count(
      // crossAxisCount: 2,
      // childAspectRatio: 1.2,
      // children: [
      // SampleAvatar(
      //   imag: 'assets/images/dig.jpeg',
      //   tox: "Digestive",
      //   press: () => Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => TestDig())),
      // ),
      // SampleAvatar(
      //     imag: 'assets/images/gon.jpeg',
      //     tox: "gonadique",
      //     press: () {}),
      // SampleAvatar(
      //   imag: 'assets/images/gr1.jpeg',
      //   tox: "cutanee",
      //   press: () => Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => TestCut())),
      // ),
      // SampleAvatar(
      //   imag: 'assets/images/neur.jpeg',
      //   tox: "Neurologique",
      //   press: () => Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => TestNeur())),
      // ),
      // SampleAvatar(
      //     imag: 'assets/images/arth.jpeg',
      //     tox: "Arthromyalgique ",
      //     press: () {}),
      // SampleAvatar(
      //     imag: 'assets/images/eye.jpeg',
      //     tox: "oculaire",
      //     press: () {}),
      //   ],
      // ),
    );
  }
}

class SampleAvatar extends StatelessWidget {
  final String imag;
  final String tox;
  final VoidCallback press;
  SampleAvatar({
    Key key,
    @required this.imag,
    @required this.tox,
    @required this.press,
  }) : super(key: key);
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //width: c_width,
      margin: const EdgeInsets.all(14),
      //padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.23),
            spreadRadius: -4,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        //borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                imag,
                width: 120,
              ),
              /*Container(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Image.asset(
                  imag,
                  //width: 100,
                ),
              )),*/
              Spacer(),
              //const Spacer(),
              Text(tox, style: TextStyle(fontFamily: "DMSans", fontSize: 15))
            ],
          ),
        ),
      ),
    );
  }
}

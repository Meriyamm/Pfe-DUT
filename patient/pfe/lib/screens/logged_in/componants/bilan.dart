import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe/model/user_model.dart';
import 'package:pfe/screens/logged_in/componants/bilan_details.dart';
import 'package:pfe/screens/logged_in/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../api/login_api.dart';
import '../../../model/bilan_model.dart';

class BilanScreen extends StatefulWidget {
  BilanScreen({
    Key key,
  }) : super(key: key);
  @override
  _BilanState createState() => _BilanState();
}

class _BilanState extends State<BilanScreen> {
  var bilans = <BilanInfo>[];
  @override
  void initState() {
    _initData();
    super.initState();
  }

  _initData() async {
    String myUrl = 'bilan';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.get(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }).then((response) {
      if (response.statusCode == 200) {
        //List jsonResponse = json.decode(response.body);
        setState(() {
          List jsonResponse = json.decode(response.body)['bilan'];
          bilans =
              jsonResponse.map((data) => new BilanInfo.fromJson(data)).toList();
        });
        print(bilans);
      } else {
        throw Exception('Unexpected error occured!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247)),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
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
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Text(
                              'فحص طبي',
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 25,
                                  color: Color(0xFF0f3c78),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Image.asset(
                                'assets/icons/medical-report.png',
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: bilans.length == 0
                          ? CircularProgressIndicator(
                              color: Color.fromARGB(255, 69, 180, 164),
                            )
                          : Column(
                              children: bilans.map((bilan) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => DetailsBilan(
                                                date: bilan.created_at,
                                                grade: bilan.grade,
                                                img: bilan.img,
                                                symp: bilan.symp,
                                                tox: bilan.tox))));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 17),
                                    width: 450,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        //shape: BoxShape.circle,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.23),
                                            spreadRadius: -4,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          )
                                        ]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          DetailsBilan(
                                                              date: bilan
                                                                  .created_at,
                                                              grade:
                                                                  bilan.grade,
                                                              img: bilan.img,
                                                              symp: bilan.symp,
                                                              tox:
                                                                  bilan.tox))));
                                            },
                                            icon: Icon(
                                              Icons.arrow_left_rounded,
                                              color: Color.fromARGB(
                                                  255, 69, 180, 164),
                                              size: 35,
                                            )),
                                        Spacer(),
                                        Text(
                                          bilan.created_at,
                                          style: TextStyle(
                                              fontFamily: "DMSans",
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                    ),
                  ),
                ],
              ))
            ]),
          ))
        ])));
  }
}

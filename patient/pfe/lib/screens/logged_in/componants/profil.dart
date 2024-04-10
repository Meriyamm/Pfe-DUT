import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pfe/model/user_model.dart';
import 'package:pfe/screens/logged_in/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../api/login_api.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key key,
  }) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  String name, ip, birth, protocol, lastcure;
  @override
  void initState() {
    _initData();
    super.initState();
  }

  _initData() async {
    String myUrl = 'user';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    List Result;
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.get(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }).then((response) {
      if (response.statusCode == 200) {
        //List jsonResponse = json.decode(response.body);
        setState(() {
          name = json.decode(response.body)['name'];
          ip = json.decode(response.body)['ip'];
          protocol = json.decode(response.body)['protocol'];
          lastcure = json.decode(response.body)['dateDernierCure'];
          birth = json.decode(response.body)['dateNaissance'];
          print(name);
        });

        // List jsonResponse = json.decode(response.body);
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
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  "الملف الشخصي",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 25,
                                      color: Color(0xFF0f3c78),
                                      fontWeight: FontWeight.bold),
                                ),

                                // IconButton(
                                //   onPressed: () {},
                                //   icon: Icon(
                                //     Icons.person,
                                //     size: 50,
                                //   ),
                                // ),
                                Image.asset(
                                  'assets/icons/login2.png',
                                  width: 100,
                                ),
                                // Text(
                                //   'Patient ' + ip,
                                //   style: TextStyle(
                                //       fontSize: 16,
                                //       fontFamily: 'DMSans',
                                //       color: Colors.grey),
                                // ),
                                Row(
                                  children: [],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: name == null ||
                                ip == null ||
                                birth == null ||
                                lastcure == null
                            ? CircularProgressIndicator(
                                color: Color(0xFF26d3ba),
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          ip,
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16,
                                              color: Colors.grey),
                                        ),
                                        Spacer(),
                                        Text(
                                          'رقم المريض -  ',
                                          style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 17,
                                          ),
                                        ),
                                        Icon(Icons.perm_identity)
                                      ],
                                    ),
                                  ),

                                  Divider(color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Text(
                                          name,
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16,
                                              color: Colors.grey),
                                        ),
                                        Spacer(),
                                        Text(
                                          'الإسم -  ',
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 17),
                                        ),
                                        Icon(Icons.near_me)
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Text(
                                          birth,
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16,
                                              color: Colors.grey),
                                        ),
                                        Spacer(),
                                        Text(
                                          'تاريخ الميلاد -',
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 17),
                                        ),
                                        Icon(Icons.cake),
                                      ],
                                    ),
                                  ),
                                  // Divider(color: Colors.black),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(20),
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         lastcure,
                                  //         style: TextStyle(
                                  //             fontFamily: 'DMSans',
                                  //             fontSize: 16,
                                  //             color: Colors.grey),
                                  //       ),
                                  //       Spacer(),
                                  //       Text(
                                  //         'تاريخ آخر علاج -',
                                  //         style: TextStyle(
                                  //           fontFamily: 'DMSans',
                                  //           fontSize: 17,
                                  //         ),
                                  //       ),
                                  //       Icon(Icons.health_and_safety),
                                  //     ],
                                  //   ),
                                  // ),
                                  Divider(color: Colors.black),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(20),
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         protocol.toString(),
                                  //         style: TextStyle(
                                  //             fontFamily: 'DMSans',
                                  //             fontSize: 16,
                                  //             color: Colors.grey),
                                  //       ),
                                  //       Spacer(),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                      )),
                    ],
                  ))
                ]),
          ))
        ])));
  }
}

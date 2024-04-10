import 'dart:convert';
//import 'dart:html';

//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:pfe/model/login_model.dart';
import 'package:pfe/screens/anonyme/componants/nav_bar.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pfe/screens/logged_in/componants/cure.dart';
import 'package:pfe/screens/logged_in/componants/cure_details.dart';
import 'package:pfe/screens/logged_in/componants/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/login_api.dart';
import '../../components/primary_buttons.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../components/text_widget.dart';
import '../../model/cure_model.dart';
import '../../model/posts_model.dart';

class HomeScr extends StatefulWidget {
  HomeScr({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<HomeScr> {
  //VoidCallback action;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var cures = <CureInfo>[];
  var reste;
  bool works;
  DateTime dt;
  FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    //PostCure();
    GetCure();
    super.initState();
    // futureData = fetchData();
    //futureCure = PostCure();
  }

  DateTime selectedDate;
  PostCure(String next) async {
    //var res = await CallApi().getData('posts');
    String myUrl = 'cures';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.post(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }, body: {
      'dateCure': next,
    }).then((response) {
      if (response.statusCode == 200) {
        print('Response body : ${response.body}');
        // return 'Response body : ${response.body}';

      }
    });
    await GetCure();
  }

  GetCure() async {
    //var res = await CallApi().getData('posts');
    String myUrl = 'cures';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.get(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }).then((response) {
      if (response.statusCode == 200) {
        print('Response body : ${response.body}');
        //return 'Response body : ${response.body}';
        setState(() {
          List jsonResponse = json.decode(response.body)['cures'];
          // List map = jsonResponse['data'];
          //print(map[2]);
          //print(jsonResponse);
          //print(map);
          dt = DateTime.parse(jsonResponse[0]['normalnext']);

          works == true;
          print(dt);
          DateTime now = DateTime.now();
          print(now);
          reste = dt.difference(now).inDays;
          print(reste);
          cures =
              jsonResponse.map((data) => new CureInfo.fromJson(data)).toList();
        });
        print(cures);
      }
      works == false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DateTime dateOnly = now.getDateOnly();
    final double width = MediaQuery.of(context).size.width;

    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);
    DateTime dateafter =
        DateTime(dateToday.year, dateToday.month, dateToday.day + 21);
    String date1 = dateToday.toString().substring(0, 10);
    var size = MediaQuery.of(context).size;
    final format = DateFormat("yyyy-MM-dd");
    Future speak() async {
      await flutterTts.setLanguage("fr-FR");
      //print(await flutterTts.getLanguages);
      await flutterTts.speak("21 jours jusqu'au prochain cure");
    }

    return Scaffold(
      key: _scaffoldKey,
      // drawer: NavBar(),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(70.0),
      //   child: AppBar(
      //     flexibleSpace: Container(
      //       decoration: const BoxDecoration(
      //           gradient: LinearGradient(colors: <Color>[
      //         Color(0xFF0f3c78),
      //         Color(0xFF26d3ba),
      //       ])),
      //     ),
      //     leading: Padding(
      //       padding: const EdgeInsets.only(top: 8, left: 8),
      //       child: Container(
      //         alignment: Alignment.center,
      //         height: 52,
      //         width: 52,
      //         decoration: const BoxDecoration(
      //           color: Color.fromARGB(71, 116, 180, 214),
      //           shape: BoxShape.circle,
      //         ),
      //         child: IconButton(
      //           icon: Image.asset('assets/icons/menu2.png'),
      //           color: Colors.white,
      //           onPressed: () {
      //             _scaffoldKey.currentState.openDrawer();
      //           },

      //           // =>
      //           // Navigator.push(
      //           //     context,
      //           //     MaterialPageRoute(
      //           //         builder: (context) => ProfileScreen())),
      //           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Center(
          child: cures.length == 0
              ?
              // CircularProgressIndicator(
              //     color: Color.fromARGB(255, 69, 180, 164),
              //   )
              Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            height: size.height * .36,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: <Color>[
                              Color(0xFF0f3c78),
                              Color(0xFF26d3ba),
                            ]))),
                        Center(
                          child: Container(
                            //margin: const EdgeInsets.only(bottom: 50),
                            width: 230,
                            height: 200,
                            // decoration: BoxDecoration(
                            //   //shape: BoxShape.circle,
                            //   //color: Colors.white,
                            //   boxShadow: [
                            //     BoxShadow(
                            //       color: Colors.black.withOpacity(0.23),
                            //       spreadRadius: -4,
                            //       blurRadius: 10,
                            //       offset: const Offset(
                            //           0, 1), // changes position of shadow
                            //     ),
                            //   ],
                            // ),
                            child: Material(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'دخل نهار لي دوزتي فيه',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontFamily: 'DMSans'),
                                  ),
                                  Text(
                                    "! العلاج اللخر",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontFamily: 'DMSans'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DateTimeFormField(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: 'آخر علاج',
                          ),
                          mode: DateTimeFieldPickerMode.dateAndTime,
                          //autovalidateMode: AutovalidateMode.always,
                          // validator: (e) => (e?.day ?? 0) == 1
                          //     ? 'Please not the first day'
                          //     : null,
                          //selectedDate: selectedDate,
                          onDateSelected: (DateTime value) {
                            setState(() {
                              selectedDate = value;
                              print(selectedDate);
                            });
                            PostCure(selectedDate.toString());
                          }),
                    ),
                  ],
                )

              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Row(
              //     children: [
              //       Spacer(),
              //       IconButton(
              //         icon: Icon(
              //           Icons.check_box,
              //           size: 45,
              //           color: Color(0xFF26d3ba),
              //         ),
              //         onPressed: () => PostCure(),
              //       ),
              //     ],
              //   ),
              // )

              : CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                  height: size.height * .36,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: <Color>[
                                    Color(0xFF0f3c78),
                                    Color(0xFF26d3ba),
                                  ]))),
                              Center(
                                child: InkWell(
                                  onTap: () => speak(),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 40),
                                    width: 230,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.23),
                                          spreadRadius: -4,
                                          blurRadius: 10,
                                          offset: const Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Container(
                                          //   alignment: Alignment.center,
                                          //   height: 40,
                                          //   width: 40,
                                          //   margin: EdgeInsets.all(10),
                                          //   decoration: const BoxDecoration(
                                          //     color: Colors.black,
                                          //     shape: BoxShape.circle,
                                          //   ),
                                          //   child: IconButton(
                                          //     onPressed: () => speak(),
                                          //     icon: Icon(Icons.play_arrow_rounded),
                                          //     color: Colors.white,
                                          //   ),
                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              reste != 0
                                                  ? const Text(
                                                      " نهار",
                                                      style: TextStyle(
                                                          fontFamily: "DMSans",
                                                          fontSize: 30),
                                                    )
                                                  : Text(
                                                      "اليوم",
                                                      style: TextStyle(
                                                          fontFamily: "DMSans",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 32),
                                                    ),
                                              reste != 0
                                                  ? Text(
                                                      reste.toString(),
                                                      style: const TextStyle(
                                                          fontFamily: "DMSans",
                                                          fontSize: 25),
                                                    )
                                                  : Text(
                                                      "",
                                                      style: const TextStyle(
                                                          fontFamily: "DMSans",
                                                          fontSize: 25),
                                                    )
                                            ],
                                          ),
                                          reste != 0
                                              ? const Text("حتال العلاج جاي",
                                                  style: TextStyle(
                                                      fontFamily: "DMSans",
                                                      fontSize: 18))
                                              : Text(
                                                  "كاين العلاج",
                                                  style: const TextStyle(
                                                      fontFamily: "DMSans",
                                                      fontSize: 20),
                                                )
                                          // Text("cure",
                                          //     style: TextStyle(
                                          //         fontFamily: "DMSans", fontSize: 18))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.23),
                                      spreadRadius: -4,
                                      blurRadius: 10,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin: const EdgeInsets.all(20),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: 450,
                              height: reste > 0 ? 100 : 160,
                              decoration: BoxDecoration(
                                  //shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.23),
                                      spreadRadius: -4,
                                      blurRadius: 10,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    )
                                  ]),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  Text(
                                    " العلاج الجاي",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 17,
                                        color: Color.fromARGB(104, 12, 58, 95)),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        cures[0].next,
                                        style: TextStyle(
                                            fontFamily: "DMSans", fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(': الوقت ',
                                          style: TextStyle(
                                              fontFamily: "DMSans",
                                              fontSize: 17))
                                    ],
                                  ),
                                  reste <= 0
                                      ? RaisedButton(
                                          onPressed: () {
                                            PostCure(dt.toString());
                                          },
                                          child: Text(
                                            'داز ؟',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'DMSans'),
                                          ),
                                          color: Color(0xff26d3ba),
                                        )
                                      : Container(),
                                  Spacer()
                                ],
                              )),
                          Container(
                              margin: const EdgeInsets.all(20),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: 450,
                              height: 150,
                              decoration: BoxDecoration(
                                  //shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.23),
                                      spreadRadius: -10,
                                      blurRadius: 10,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    )
                                  ]),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  Text(
                                    "آخر علاج",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 12, 58, 95)),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // IconButton(
                                      //     onPressed: () {},
                                      //     icon: Icon(
                                      //       Icons.arrow_left_rounded,
                                      //       color: Color.fromARGB(
                                      //           255, 69, 180, 164),
                                      //       size: 35,
                                      //     )),

                                      Text(
                                        cures[0].last,
                                        style: TextStyle(
                                            fontFamily: "DMSans", fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(': الوقت ',
                                          style: TextStyle(
                                              fontFamily: "DMSans",
                                              fontSize: 17))
                                    ],
                                  ),
                                  Spacer()
                                ],
                              )),
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'علاجاتي',
                                    style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 69, 180, 164),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Column(
                      children: cures.map((cure) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CureDetails(
                                      analyses: cure.analyses,
                                      date: cure.last))),
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: 450,
                            height: 70,
                            decoration: BoxDecoration(
                                //shape: BoxShape.circle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.23),
                                    spreadRadius: -4,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  )
                                ]),
                            child: Column(
                              children: [
                                //Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CureDetails(
                                                        analyses: cure.analyses,
                                                        date: cure.last))),
                                        icon: Icon(
                                          Icons.arrow_left_rounded,
                                          color:
                                              Color.fromARGB(255, 69, 180, 164),
                                          size: 35,
                                        )),
                                    Spacer(),
                                    Text(
                                      cure.last,
                                      style: TextStyle(
                                          fontFamily: "DMSans", fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),

                      // SliverToBoxAdapter(
                      //     child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: <Widget>[
                      //       Container(
                      //         margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: [
                      //             Text(
                      //               'كلشي',
                      //               style: TextStyle(
                      //                   fontFamily: 'DMSans',
                      //                   color: Color.fromARGB(255, 69, 180, 164),
                      //                   decoration: TextDecoration.underline),
                      //             ),
                      //             Spacer(),
                      //             Text(
                      //               'علاجاتي',
                      //               style: TextStyle(fontFamily: "DMSans", fontSize: 25),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //         margin: const EdgeInsets.all(20),
                      //         padding: EdgeInsets.symmetric(horizontal: 20),
                      //         width: 450,
                      //         height: 60,
                      //         decoration: BoxDecoration(
                      //           //shape: BoxShape.circle,
                      //           color: Colors.white,
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: Colors.black.withOpacity(0.23),
                      //               spreadRadius: -4,
                      //               blurRadius: 10,
                      //               offset:
                      //                   const Offset(0, 1), // changes position of shadow
                      //             ),
                      //           ],
                      //         ),
                      //         child: Material(
                      //           color: Colors.transparent,
                      //           child: InkWell(
                      //             onTap: () => Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (context) => CureScreen())),
                      //             // child: Row(
                      //             //   mainAxisAlignment: MainAxisAlignment.end,
                      //             //   children: cures.map((cure) {
                      //             //     IconButton(
                      //             //         onPressed: () {},
                      //             //         icon: Icon(
                      //             //           Icons.arrow_right_rounded,
                      //             //           color: Color.fromARGB(255, 69, 180, 164),
                      //             //           size: 35,
                      //             //         ));
                      //             //     Spacer();
                      //             //     Text(
                      //             //       cure.last,
                      //             //       style: TextStyle(
                      //             //           fontFamily: "DMSans",
                      //             //           fontSize: 15,
                      //             //           color: Colors.grey),
                      //             //     );
                      //             //     Spacer();
                      //             //     Text(
                      //             //       "آخر علاج",
                      //             //       style: TextStyle(fontFamily: "DMSans", fontSize: 17),
                      //             //     );
                      //             //   }).toList(),
                      //             // ),
                      //             //Column(children: <Widget>[
                      //             // DateTimeField(
                      //             //     decoration: const InputDecoration(
                      //             //         hintText: ' دخل نهار لي بانت فيه!'),
                      //             //     selectedDate: selectedDate,
                      //             //     onDateSelected: (DateTime value) {
                      //             //       setState(() {
                      //             //         selectedDate = value;
                      //             //         print(value);
                      //             //       });
                      //             //     }),
                      //             //                       Padding(
                      //             //                         padding: const EdgeInsets.all(10),
                      //             //                         child: Row(
                      //             //                           children: [
                      //             //                             Spacer(),
                      //             //                             IconButton(
                      //             //                               icon: Icon(
                      //             //                                 Icons.check_box,
                      //             //                                 size: 45,
                      //             //                                 color: Color(0xFF26d3ba),
                      //             //                               ),
                      //             //                               onPressed: () => PostCure(),
                      //             //                             ),
                      //             //                           ],
                      //             //                         ),
                      //             //                       )
                      //             //                     ])),
                      //             //               ),
                      //             //             ),
                      //             //           ]),
                      //             //     ),
                      //             //     SliverToBoxAdapter(
                      //             //       child: Expanded(
                      //             //         child: SingleChildScrollView(
                      //             //           child: Column(
                      //             //             children: cures.map((cure) {
                      //             //               //debugPrint(cure.img.toString());
                      //             //               return GestureDetector(
                      //             //                   // onTap:(){
                      //             //                   //   Navigator.push(context,
                      //             //                   //       MaterialPageRoute(builder: (context)=>DetailBookPage(cureInfo:cure, index:0))
                      //             //                   //   );
                      //             //                   // },
                      //             //                   child: Container(
                      //             //                       padding: const EdgeInsets.only(left: 20, right: 20),
                      //             //                       height: 250,
                      //             //                       child: Stack(
                      //             //                         children: [
                      //             //                           Positioned(
                      //             //                               top: 35,
                      //             //                               child: new Material(
                      //             //                                   elevation: 0.0,
                      //             //                                   child: new Container(
                      //             //                                     height: 180.0,
                      //             //                                     width: width * 0.9,
                      //             //                                     decoration: BoxDecoration(
                      //             //                                       color: Colors.white,
                      //             //                                       borderRadius:
                      //             //                                           BorderRadius.circular(0.0),
                      //             //                                       boxShadow: [
                      //             //                                         new BoxShadow(
                      //             //                                             color: Colors.grey
                      //             //                                                 .withOpacity(0.3),
                      //             //                                             offset: new Offset(0.0, 0.0),
                      //             //                                             blurRadius: 20.0,
                      //             //                                             spreadRadius: 4.0)
                      //             //                                       ],
                      //             //                                     ),
                      //             //                                     // child: Text("This is where your content goes")
                      //             //                                   ))),
                      //             //                           Positioned(
                      //             //                               top: 0,
                      //             //                               left: 10,
                      //             //                               child: Card(
                      //             //                                   elevation: 10.0,
                      //             //                                   shadowColor:
                      //             //                                       Colors.grey.withOpacity(0.5),
                      //             //                                   shape: RoundedRectangleBorder(
                      //             //                                     borderRadius:
                      //             //                                         BorderRadius.circular(15.0),
                      //             //                                   ),
                      //             //                                   child: Container(
                      //             //                                       height: 200,
                      //             //                                       width: 150,
                      //             //                                       decoration: BoxDecoration(
                      //             //                                         borderRadius:
                      //             //                                             BorderRadius.circular(10.0),
                      //             //                                         // image:  DecorationImage(
                      //             //                                         //   fit:BoxFit.fill,
                      //             //                                         //   image:NetworkImage("http://mark.dbestech.com/uploads/"+cure.img),
                      //             //                                         // ),
                      //             //                                       )))),
                      //             //                           Positioned(
                      //             //                               top: 45,
                      //             //                               left: width * 0.4,
                      //             //                               child: Container(
                      //             //                                   height: 200,
                      //             //                                   width: 150,
                      //             //                                   child: Column(
                      //             //                                     crossAxisAlignment:
                      //             //                                         CrossAxisAlignment.start,
                      //             //                                     children: [
                      //             //                                       TextWidget(
                      //             //                                           text: cure.last,
                      //             //                                           fontSize: 20,
                      //             //                                           color: Colors.grey),
                      //             //                                       TextWidget(
                      //             //                                           text: "Author: Mike Ahmed",
                      //             //                                           fontSize: 16),
                      //             //                                       Divider(color: Colors.black),
                      //             //                                       TextWidget(
                      //             //                                           text: cure.next,
                      //             //                                           fontSize: 16,
                      //             //                                           color: Colors.grey),
                      //             //                                     ],
                      //             //                                   ))),
                      //             //                         ],
                      //             //                       )));
                      //             //             }).toList(),
                      //           ),
                      //         ),
                      //       ),
                      //     ]))
                    ))
                  ],
                )),
    );
  }
}

class post extends StatelessWidget {
  FlutterTts flutterTts = FlutterTts();
  final String user;
  final String cont;
  final String date;
  final String numcom;
  //final VoidCallback press;
  post({
    Key key,
    @required this.user,
    @required this.cont,
    @required this.date,
    @required this.numcom,
    //@required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future speak() async {
      await flutterTts.setLanguage("en-US");
      //print(await flutterTts.getLanguages);
      await flutterTts.speak(cont);
    }

    double c_width = MediaQuery.of(context).size.width * 0.8;
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          //height: double.infinity,
          //width: double.infinity,
          //width: c_width,
          margin: const EdgeInsets.all(10),
          //padding: const EdgeInsets.all(17),
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
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.person),
                              iconSize: 30,
                            ),
                            Text(
                              user,
                              style:
                                  TextStyle(fontSize: 16, fontFamily: "DMSans"),
                              //textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          date,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "DMSans"),
                        ),
                      ],
                    ),
                    //Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cont,
                        maxLines: 2,
                        style: const TextStyle(fontFamily: "DMSans"),
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
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
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Text(
                          numcom + " comments",
                          style: const TextStyle(
                              color: Colors.grey, fontFamily: "DMSans"),
                        ),
                        const Spacer(),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       Icons.favorite,
                        //       size: 30,
                        //       color: Color(0xff25ccb7),
                        //     )),
                        Image.asset(
                          "assets/icons/comment.png",
                          width: 25,
                        )
                        /*IconButton(
                          onPressed: press,
                          icon: const Icon(
                            Icons.comment,
                            color: Color(0xff1fa5a6),
                            size: 30,
                          ))*/
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe/screens/anonyme/componants/nav_bar.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pfe/screens/logged_in/componants/cure.dart';
import 'package:pfe/screens/logged_in/componants/profil.dart';
import '../../components/primary_buttons.dart';
import 'package:intl/intl.dart';

class HomeScr extends StatelessWidget {
  HomeScr({Key key}) : super(key: key);
  FlutterTts flutterTts = FlutterTts();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // DateTime dateOnly = now.getDateOnly();
    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);
    DateTime dateafter =
        DateTime(dateToday.year, dateToday.month, dateToday.day + 21);
    String date1 = dateToday.toString().substring(0, 10);
    var size = MediaQuery.of(context).size;
    Future speak() async {
      await flutterTts.setLanguage("fr-FR");
      //print(await flutterTts.getLanguages);
      await flutterTts.speak("21 jours jusqu'au prochain cure");
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavBar(),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Color(0xFF0f3c78), Color(0xFF26d3ba)])),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                alignment: Alignment.center,
                height: 52,
                width: 52,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(71, 116, 180, 214),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Image.asset('assets/icons/menu2.png'),
                  color: Colors.white,
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },

                  // =>
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ProfileScreen())),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                // SliverToBoxAdapter(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Stack(
                //         children: [
                //           Container(
                //               height: size.height * .40,
                //               decoration: const BoxDecoration(
                //                   gradient: LinearGradient(colors: <Color>[
                //                 Color(0xFF0f3c78),
                //                 Color(0xFF26d3ba)
                //               ]))),
                //           /*Container(
                //               margin: const EdgeInsets.only(bottom: 6, top: 40),
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 15, vertical: 15),
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(70),
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.black.withOpacity(0.23),
                //                     spreadRadius: -4,
                //                     blurRadius: 10,
                //                     offset: const Offset(
                //                         0, 1), // changes position of shadow
                //                   ),
                //                 ],
                //               ),
                //               child: Text(
                //                 "21 jours \njusqu'au prochain cure",
                //                 style: TextStyle(fontFamily: "DMSans", fontSize: 30),
                //               )),*/
                //           Center(
                //             child: Container(
                //               margin: const EdgeInsets.only(top: 40),
                //               width: 250,
                //               height: 230,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Colors.white,
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.black.withOpacity(0.23),
                //                     spreadRadius: -4,
                //                     blurRadius: 10,
                //                     offset: const Offset(
                //                         0, 1), // changes position of shadow
                //                   ),
                //                 ],
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: <Widget>[
                //                   Text(
                //                     "21 jours",
                //                     style: TextStyle(
                //                         fontFamily: "DMSans", fontSize: 30),
                //                   ),
                //                   Text("jusqu'au prochain",
                //                       style: TextStyle(
                //                           fontFamily: "DMSans", fontSize: 18)),
                //                   Text("cure",
                //                       style: TextStyle(
                //                           fontFamily: "DMSans", fontSize: 18))
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       Text("Mes cures"),
                //       Padding(
                //         padding: const EdgeInsets.all(3),
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.black.withOpacity(0.23),
                //                 spreadRadius: -4,
                //                 blurRadius: 10,
                //                 offset: const Offset(
                //                     0, 1), // changes position of shadow
                //               ),
                //             ],
                //           ),
                //           margin:
                //               EdgeInsets.only(left: 30, right: 30, bottom: 30),
                //           child: ExpansionTile(
                //             title: Text(
                //               'dernier cure',
                //               style: TextStyle(fontFamily: "DMSans"),
                //             ),
                //             iconColor: Color.fromARGB(255, 69, 180, 164),
                //             textColor: Color.fromARGB(255, 69, 180, 164),
                //             children: [
                //               ListTile(
                //                 title: Text("aaaa",
                //                     style: TextStyle(fontFamily: "DMSans")),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),

                //     ],
                //   ),
                // ),
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Container(
                          height: size.height * .36,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: <Color>[
                            Color(0xFF0f3c78),
                            Color(0xFF26d3ba)
                          ]))),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 70),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         date,
                      //         style: TextStyle(
                      //             fontFamily: "DMSans", color: Colors.white),
                      //       ),
                      //       IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(
                      //             Icons.arrow_right_alt,
                      //             color: Colors.white,
                      //           )),
                      //       Text(
                      //         date1,
                      //         style: TextStyle(
                      //             fontFamily: "DMSans", color: Colors.white),
                      //       )
                      //     ],
                      //   ),
                      // ),
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
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  Text(
                                    "21 jours",
                                    style: TextStyle(
                                        fontFamily: "DMSans", fontSize: 30),
                                  ),
                                  Text("jusqu'au prochain",
                                      style: TextStyle(
                                          fontFamily: "DMSans", fontSize: 18)),
                                  Text("cure",
                                      style: TextStyle(
                                          fontFamily: "DMSans", fontSize: 18))
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
                ),
                SliverToBoxAdapter(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Row(
                            children: [
                              Text(
                                'Mes cures',
                                style: TextStyle(
                                    fontFamily: "DMSans", fontSize: 25),
                              ),
                              Spacer(),
                              Text(
                                'voir tout',
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    color: Color.fromARGB(255, 69, 180, 164),
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: 450,
                          height: 60,
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
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CureScreen())),
                              child: Row(
                                children: [
                                  Text(
                                    "Dernier cure",
                                    style: TextStyle(
                                        fontFamily: "DMSans", fontSize: 17),
                                  ),
                                  Spacer(),
                                  Text(
                                    date,
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_right_rounded,
                                        color:
                                            Color.fromARGB(255, 69, 180, 164),
                                        size: 35,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Text(
                                'Posts',
                                style: TextStyle(
                                    fontFamily: "DMSans", fontSize: 25),
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Ajouter',
                                  style: TextStyle(fontFamily: "DMSans"),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 69, 180, 164),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                SliverGrid.count(
                  crossAxisCount: 1,
                  childAspectRatio: 1.5,
                  children: <Widget>[
                    post(
                      user: 'ali ali',
                      cont: "i need a medication for my rash",
                      numcom: "5",
                      date: "mon 12/02/22",
                      press: () {},
                    ),
                    post(
                      user: 'sanaa el ghoul',
                      cont: "treatment has improved my constipation",
                      numcom: "10",
                      date: "mon 12/02/22",
                      press: () {},
                    ),
                    post(
                      user: 'taha dibesse',
                      cont: "something something something",
                      numcom: "13",
                      date: "mon 12/02/22",
                      press: () {},
                    ),
                  ],
                ),
              ],
            ),
          )
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
  final VoidCallback press;
  post({
    Key key,
    @required this.user,
    @required this.cont,
    @required this.date,
    @required this.numcom,
    @required this.press,
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
              onTap: press,
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

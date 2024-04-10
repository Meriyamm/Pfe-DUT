import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pfe/screens/anonyme/componants/digestive.dart';
import 'package:pfe/screens/anonyme/componants/nav_bar.dart';
import 'package:pfe/screens/anonyme/componants/nav_bar2.dart';
import 'package:pfe/screens/logged_in/componants/profil.dart';

import '../anonyme/componants/cutanee.dart';

class Advices extends StatelessWidget {
  Advices({Key key}) : super(key: key);
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247)),
        home: Scaffold(
            key: _scaffoldKey,
            drawer: NavBar(),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     height: 52,
                      //     width: 52,
                      //     decoration: const BoxDecoration(
                      //       color: Color.fromARGB(131, 177, 241, 232),
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: IconButton(
                      //       icon: Image.asset('assets/icons/menu3.png'),
                      //       color: Colors.white,
                      //       onPressed: () => Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => NavBar())),
                      //       tooltip: MaterialLocalizations.of(context)
                      //           .openAppDrawerTooltip,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29.5),
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
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: const TextField(
                              decoration: InputDecoration(
                            hintText: "بحث",
                            hintStyle: TextStyle(fontFamily: "DMSans"),
                            icon: Icon(
                              Icons.search,
                              color: Color(0xFF26d3ba),
                            ),
                            border: InputBorder.none,
                          )),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 1,
                          childAspectRatio: 1.1,
                          children: <Widget>[
                            Toxicity(
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DigAdvice())),
                                timg: 'assets/images/dig.jpeg',
                                title: "سمية الجهاز الهضمي"),
                            Toxicity(
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CutAdvice())),
                                timg: "assets/images/gr2.jpeg",
                                title: "سمية الجلد"),
                            /*Toxicity(
                                timg: 'assets/images/gon.jpeg',
                                title: "Toxicite gonadique"),
                            Toxicity(
                                timg: 'assets/images/neur.jpeg',
                                title: "Toxicite neurologique"),*/
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ])));
  }
}

class Toxicity extends StatelessWidget {
  final String timg;
  final String title;
  final VoidCallback press;

  const Toxicity({
    Key key,
    @required this.timg,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //width: c_width,
      margin: const EdgeInsets.all(17),
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
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Image.asset(timg),
                  )),
              //Spacer(),
              //const Spacer(),
              Text(title, style: TextStyle(fontFamily: "DMSans", fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}

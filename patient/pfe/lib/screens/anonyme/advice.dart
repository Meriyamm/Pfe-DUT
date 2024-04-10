import 'package:flutter/material.dart';
import 'package:pfe/screens/anonyme/componants/cutanee.dart';
import 'package:pfe/screens/anonyme/componants/digestive.dart';
import 'package:pfe/screens/anonyme/componants/nav_bar2.dart';

class Advice extends StatelessWidget {
  Advice({Key key}) : super(key: key);
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
            drawer: const NavBar2(),
            body: Stack(children: <Widget>[
              /*Container(
                  height: size.height * .30,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Color(0xFF0f3c78),
                    Color(0xFF26d3ba)
                  ]))),*/
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /*Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(131, 177, 241, 232),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Image.asset('assets/icons/menu3.png'),
                            color: Colors.white,
                            onPressed: () {
                              _scaffoldKey.currentState.openDrawer();
                            },
                            tooltip: MaterialLocalizations.of(context)
                                .openAppDrawerTooltip,
                          ),
                        ),
                      ),*/
                    Container(
                        margin: const EdgeInsets.only(bottom: 1, top: 40),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(70),
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
                        child: Image.asset(
                          "assets/images/breast-cancer.png",
                          width: 55,
                        )),
                    Container(
                      // margin: const EdgeInsets.symmetric(
                      //     vertical: 18, horizontal: 20),
                      //padding: const EdgeInsets.only(bottom: 25, top: 4),
                      /*decoration: BoxDecoration(
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
                        ),*/
                      child: Text(
                        'نصائح',
                        style: TextStyle(fontSize: 25, fontFamily: "DMSans"),
                      ),
                    ),
                    //const TextField(
                    //       decoration: InputDecoration(
                    //     hintText: "search",
                    //     hintStyle: TextStyle(fontFamily: "DMSans"),
                    //     icon: Icon(
                    //       Icons.search,
                    //       color: Color(0xFF26d3ba),
                    //     ),
                    //     border: InputBorder.none,
                    //   )),
                    // ),
                    Expanded(
                      child: Container(
                        height: size.height * .30,
                        decoration: BoxDecoration(
                          //color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        child: GridView.count(
                          crossAxisCount: 1,
                          childAspectRatio: 1.2,
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
                      ),
                    )
                  ],
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
      margin: const EdgeInsets.only(left: 50, right: 50, top: 17, bottom: 10),
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

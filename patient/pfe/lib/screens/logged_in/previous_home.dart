import 'package:flutter/material.dart';
import 'package:pfe/screens/anonyme/componants/nav_bar.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../components/primary_buttons.dart';
//import 'package:expandable_text/expandable_text.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  FlutterTts flutterTts = FlutterTts();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  get kPrimaryColor => null;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247)),
        home: Scaffold(
          key: _scaffoldKey,
          //drawer: const NavBar(),
          body: Stack(
            children: <Widget>[
              Container(
                  height: size.height,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Color(0xFF0f3c78),
                    Color(0xFF26d3ba)
                  ]))),
              SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
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
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
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
                      child: const TextField(
                          decoration: InputDecoration(
                        hintText: "search",
                        hintStyle: TextStyle(fontFamily: "DMSans"),
                        icon: Icon(Icons.search),
                        border: InputBorder.none,
                      )),
                    ),
                    //

                    /*Row(
                      children: [
                        Text(
                          "Posts",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        PrimaryButton(
                          text: '+ Add',
                          press: () {},
                          color: kPrimaryColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),*/

                    Expanded(
                      child: GridView.count(
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
                    ),
                  ],
                ),
              ))
            ],
          ),
          //drawer: NavBar(),
        ));
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
      ),
    );
  }
}

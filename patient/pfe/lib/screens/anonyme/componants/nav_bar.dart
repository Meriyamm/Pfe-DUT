import 'package:flutter/material.dart';
import 'package:pfe/constants.dart';
import 'package:pfe/screens/anonyme/advice.dart';
import 'package:pfe/screens/home/components/body.dart';
import 'package:pfe/screens/home/home_screen.dart';
import 'package:pfe/screens/logged_in/componants/bilan.dart';
import 'package:pfe/screens/logged_in/componants/profil.dart';
import 'package:pfe/screens/logged_in/home_screen.dart';

import '../../logged_in/componants/general_health.dart';
//import 'package:drawerbehavior/drawer_scaffold.dart';

class NavBar extends StatelessWidget {
  NavBar({
    Key key,
  }) : super(key: key);
  Future<String> CreateDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                title: Text(
                  'تقييم صحتك العامة',
                  style: TextStyle(color: Colors.black, fontFamily: "DMSans"),
                ),
                content: Text(
                  'هل تريد تقييم صحتك العامة الآن',
                  style: TextStyle(fontFamily: "DMSans"),
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: (() => Navigator.pop(context, 'Cancel')),
                      child: Text(
                        'لا',
                        style: TextStyle(fontFamily: "DMSans"),
                      )),
                  TextButton(
                      onPressed: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GeneralHealth(),
                            //Questionnaire()
                            // LoggedIn(),
                          ))),
                      child: Text(
                        'آه',
                        style: TextStyle(fontFamily: "DMSans"),
                      )),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        //backgroundColor: Color(0xff23beb1),
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Color(0xFF26d3ba),
            Color(0xFF0f3c78),
          ])),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                /*decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Color(0xFF0f3c78), Color(0xFF26d3ba)])),*/
                child: Text(
                  "Cancer Care",
                  style: TextStyle(color: Colors.white, fontFamily: "DMSans"),
                ),
                decoration: BoxDecoration(
                    //color: Colors.blue,
                    image: DecorationImage(
                  image: AssetImage("assets/icons/My project (18).png"),
                  //fit: BoxFit.fill,
                )),
              ),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              //   padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(240, 255, 255, 255),
              //     borderRadius: BorderRadius.circular(35),
              //   ),
              //   child:

              ListTile(
                title: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                    const Text(
                      'الملف الشخصي',
                      style:
                          TextStyle(color: Colors.white, fontFamily: "DMSans"),
                    ),
                  ],
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen())),
                //{Navigator.pop(context)};
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.pending_actions_outlined,
                          color: Colors.white,
                        )),
                    const Text(
                      'فحص طبي',
                      style:
                          TextStyle(color: Colors.white, fontFamily: "DMSans"),
                    ),
                  ],
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BilanScreen())),
                //{Navigator.pop(context)};
              ),
              ListTile(
                  title: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            CreateDialog(context);
                          },
                          icon: const Icon(
                            Icons.health_and_safety,
                            color: Colors.white,
                          )),
                      const Text(
                        'الحالة العامة',
                        style: TextStyle(
                            color: Colors.white, fontFamily: "DMSans"),
                      ),
                    ],
                  ),
                  onTap: () {
                    CreateDialog(context);
                  }
                  //{Navigator.pop(context)};
                  ),
              Divider(
                thickness: 1,
                color: Color.fromARGB(153, 255, 255, 255),
              ),
              ListTile(
                  title: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          )),
                      const Text('تسجيل خروج',
                          style: TextStyle(
                              color: Colors.white, fontFamily: "DMSans")),
                    ],
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()))),

              /*Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 300,
                  //alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                          )),
                      const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

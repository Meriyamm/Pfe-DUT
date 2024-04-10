import 'package:flutter/material.dart';
import 'package:pfe/constants.dart';
import 'package:pfe/screens/anonyme/advice.dart';
import 'package:pfe/screens/anonyme/ano_screen.dart';
//import 'package:drawerbehavior/drawer_scaffold.dart';

class NavBar2 extends StatelessWidget {
  const NavBar2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Color(0xff23beb1),
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color(0xFF0f3c78), Color(0xFF26d3ba)])),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                /*decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Color(0xFF0f3c78), Color(0xFF26d3ba)])),*/
                child:
                    // Image.asset('assets/icons/cancer.png',),
                    Text(
              "Cancer Care",
              style: TextStyle(color: Colors.white, fontFamily: "DMSans"),
            )),
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
                        Icons.home,
                        color: Colors.white,
                      )),
                  const Text(
                    'Posts',
                    style: TextStyle(color: Colors.white, fontFamily: "DMSans"),
                  ),
                ],
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Anonyme())),
            ),

            ListTile(
              title: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.medical_services,
                        color: Color.fromARGB(255, 115, 219, 204),
                      )),
                  const Text('Advices',
                      style: TextStyle(
                          color: Color.fromARGB(255, 115, 219, 204),
                          fontFamily: "DMSans")),
                ],
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Advice())),
              //Navigator.pop(context);
            ),

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
    );
  }
}

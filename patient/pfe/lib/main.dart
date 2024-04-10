import 'package:flutter/material.dart';
import 'package:pfe/constants.dart';
import 'package:pfe/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: 'DMSans',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.bold, color: kTextColor),
          headline6: TextStyle(
              fontSize: 25.0, fontStyle: FontStyle.italic, color: kTextColor),
          headline5: TextStyle(
              fontSize: 12.0,
              fontFamily: 'DMSans',
              color: Color(0xff041c3b),
              fontWeight: FontWeight.bold),
          bodyText2: TextStyle(
              fontSize: 14.0, fontFamily: 'DMSans', color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobilyapp/accountdoctor/compte.dart';
import 'package:mobilyapp/patients/interface_patient.dart';
import 'package:mobilyapp/welcom/Ahlan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My account',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ))),
      home: compte(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobilyapp/assistant/Idafa.dart';
import 'package:mobilyapp/assistant/docpage.dart';
import 'package:mobilyapp/connection/login.dart';
import 'package:mobilyapp/connexion%20medical%20assistant/logAssistant.dart';
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
      title: ' Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ))),
      home: idafa(),
    );
  }
}

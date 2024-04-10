import 'package:flutter/material.dart';
import 'package:mobilyapp/accountdoctor/profiledoc.dart';
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
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ))),
      home: helps(),
    );
  }
}

class helps extends StatelessWidget {
  const helps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                  'If you need any helps or requests contact one of us: \n sanaa1.elghoul@gmail.com \n meryemmeryem.elmoutaraji@gmail.com \n dibessetaha@gmail.com',
                  style: TextStyle(fontSize: 17, color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}

AppBar Bar() {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 42, 102, 110),
    centerTitle: true,
    title: Text('Help'),
    actions: <Widget>[
      FlatButton(
          onPressed: () {},
          child: Text("Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )))
    ],
  );
}

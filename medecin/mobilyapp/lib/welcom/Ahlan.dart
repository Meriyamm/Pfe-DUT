import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilyapp/connection/login.dart';
import 'package:mobilyapp/connexion%20medical%20assistant/logAssistant.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Container(
          color: Color.fromARGB(255, 42, 102, 110),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Spacer(),
            Image.asset(
              'assets/images/maak.png',
              height: 250,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Are you a ?',
                style: TextStyle(fontFamily: 'releway',
                // color: Colors.white
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => connecter(),
                          ));
                    },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFF6CDBD1)))),
                    child: Text("Doctor ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )))),
            SizedBox(
              height: 17,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => conexion(),
                          ));
                    },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFF6CDBD1)))),
                    child: Text("Medical Assistant ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )))),
            SizedBox(
              height: 17,
            )
          ]),
        ),
      ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilyapp/connection/header.dart';
import 'package:mobilyapp/connection/wrapper.dart';
import 'package:mobilyapp/connexion%20medical%20assistant/head.dart';
import 'package:mobilyapp/connexion%20medical%20assistant/wrapp.dart';

class conexion extends StatelessWidget {
  const conexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(255, 42, 102, 110),
          Color.fromARGB(255, 42, 102, 110),
          Color.fromARGB(255, 42, 102, 110),
        ]),
      ),
      child: Column(children: <Widget>[
        SizedBox(
          height: 80,
        ),
        head(),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              )),
          child: inputwrapper(),
        ))
      ]),
    ));
  }
}

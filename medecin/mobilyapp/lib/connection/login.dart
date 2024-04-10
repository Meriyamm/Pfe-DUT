import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilyapp/connection/header.dart';
import 'package:mobilyapp/connection/wrapper.dart';

class connecter extends StatelessWidget {
  const connecter({Key? key}) : super(key: key);

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
        Header(),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              )),
          child: InputWrapper(),
        ))
      ]),
    ));
  }
}

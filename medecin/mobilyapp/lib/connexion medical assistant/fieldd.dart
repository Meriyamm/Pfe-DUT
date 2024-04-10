import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class inputfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Color.fromARGB(255, 238, 238, 238)))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Enter your email Assistant",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Color.fromARGB(255, 238, 238, 238)))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}

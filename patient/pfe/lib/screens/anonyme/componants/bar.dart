import 'package:flutter/material.dart';

import 'header.dart';

class Bar extends StatelessWidget {
  const Bar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          //height: 150,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: <Color>[Color(0xFF0f3c78), Color(0xFF26d3ba)]),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.23),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: const Header(),
        ),
      ),
      //body: const BodyAno(),
    );
  }
}

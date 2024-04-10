import 'package:flutter/material.dart';
import 'package:mobilyapp/sidebar/inter.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 54, 119, 128),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Column(
        children: <Widget>[
          //  ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => face1(),
                    ));
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ))
        ],
      )),
    );
  }
}

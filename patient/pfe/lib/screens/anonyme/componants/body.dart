import 'package:flutter/material.dart';
import 'package:pfe/components/primary_buttons.dart';
import 'package:pfe/constants.dart';
import 'package:pfe/screens/anonyme/componants/header.dart';

class BodyAno extends StatelessWidget {
  const BodyAno({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 10),
      child: Row(
        children: <Widget>[
          const Text(
            "Posts",
            style: TextStyle(fontSize: 23, fontFamily: 'DMSans'),
          ),
          Container(
            color: kPrimaryColor,
            height: 50,
          ),
          PrimaryButton(
            text: '+ Add',
            press: () {},
            color: kPrimaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

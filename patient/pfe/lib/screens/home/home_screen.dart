import 'package:flutter/material.dart';
import 'package:pfe/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Directionality(textDirection: TextDirection.rtl, child: Body()),
    );
  }
}

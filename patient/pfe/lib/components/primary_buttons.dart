import 'package:flutter/material.dart';
import 'package:pfe/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key key,
    @required this.text,
    @required this.press,
    this.color = Colors.white,
    this.textColor = const Color(0xFF1A8297),
    this.padding = const EdgeInsets.all(kDefaultPadding * 0.45),
    //this.margin = const EdgeInsets.symmetric(horizontal: 5)
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final Color color;
  final Color textColor;
  final EdgeInsets padding;
  //final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      padding: padding,
      color: color,
      minWidth: double.infinity,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontFamily: "DMSans"),
      ),
    );
  }
}

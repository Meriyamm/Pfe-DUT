import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class facealerrt extends StatelessWidget {
  const facealerrt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Alert();
  }
}

class Alert extends StatelessWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 600,
            child: Table(
              border: TableBorder.all(),
              children: [],
            ),
          ),
          Positioned(
              child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 40,
            child: Icon(
              Icons.flag,
              size: 30,
              color: Colors.white60,
            ),
          ))
        ],
      ),
    );
  }
}

import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class Userpatient {
  final String name, imageUrl, lasttime;

  Userpatient({
    required this.name,
    required this.imageUrl,
    required this.lasttime,
  });
}

List User = [
  Userpatient(
    name: "سناء الغول",
    imageUrl: "assets/images/Anonym.jpeg",
    lasttime: "19/04/2022",
  ),
  Userpatient(
    name: "مريم المتراجي",
    imageUrl: "assets/images/Anonym.jpeg",
    lasttime: "10/02/2022",
  ),
  Userpatient(
    name: "طه ديباس",
    imageUrl: "assets/images/Anonym.jpeg",
    lasttime: "10/01/2022",
  ),
  // Userpatient(
  //   name: "sanaa sanaa",
  //   imageUrl: "assets/images/Anonym.jpeg",
  //   lasttime: "10/12/2021",
  // ),
  // Userpatient(
  //   name: "Meriyem elmoutaraji",
  //   imageUrl: "assets/images/Anonym.jpeg",
  //   lasttime: "10/12/2021",
  // ),
  // Userpatient(
  //   name: "taha taha ",
  //   imageUrl: "assets/images/Anonym.jpeg",
  //   lasttime: "10/11/2021",
  // ),
  // Userpatient(
  //   name: "meryem",
  //   imageUrl: "assets/images/Anonym.jpeg",
  //   lasttime: "25/08/2021",
  // ),
  // Userpatient(
  //   name: "taha",
  //   imageUrl: "assets/images/Anonym.jpeg",
  //   lasttime: "01/08/2021",
  // ),
];

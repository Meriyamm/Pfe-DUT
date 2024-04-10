// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:pfe/api/login_api.dart';
// import 'package:pfe/components/primary_buttons.dart';
// import 'package:pfe/model/toxicity_model.dart';
// import 'package:pfe/screens/anonyme/advice.dart';
// import 'package:pfe/screens/logged_in/componants/ToxicityModel.dart';
// import 'package:pfe/screens/logged_in/componants/test_dig.dart';
// import 'package:pfe/screens/logged_in/componants/test_neur.dart';
// import 'package:pfe/screens/logged_in/componants/test_Cut.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'componants/begin_test.dart';

// Future<List<ToxicityInfo>> fetchData() async {
//   var res = await CallApi().getData('welcomeinfo');
//   //final response = await http.get('http://192.168.1.110:9000/api/welcomeinfo');
//   if (res.statusCode == 200) {
//     List jsonResponse = json.decode(res.body);
//     return jsonResponse.map((data) => new ToxicityInfo.fromJson(data)).toList();
//   } else {
//     throw Exception('Unexpected error occured!');
//   }
// }

// class Test extends StatefulWidget {
//   Test({Key key}) : super(key: key);

//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   Future<List<ToxicityInfo>> futureData;
//   FlutterTts flutterTts = FlutterTts();
//   String question = "Choisissez la toxicité que \nvous voulez évaluer";
//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchData();
//   }
//   //List<Symptom> selectedSymptoms = List();

//   ////////////////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     Future speak() async {
//       await flutterTts.setLanguage("fr-FR");
//       //print(await flutterTts.getLanguages);
//       await flutterTts.speak(question);
//     }

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter API and ListView Example',
//       home: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(70),
//           child: AppBar(
//             backgroundColor: Color(0xFF26d3ba),
//             title: Container(
//               height: 50,
//               margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(29.5),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.23),
//                     spreadRadius: -4,
//                     blurRadius: 10,
//                     offset: const Offset(0, 1), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: const TextField(
//                   decoration: InputDecoration(
//                 hintText: "search",
//                 hintStyle: TextStyle(fontFamily: "DMSans"),
//                 icon: Icon(
//                   Icons.search,
//                   color: Color(0xFF26d3ba),
//                 ),
//                 border: InputBorder.none,
//               )),
//             ),
//           ),
//         ),
//         body:
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 50),
//             //   child: Text(
//             //     'Evaluation',
//             //     style: Theme.of(context)
//             //         .textTheme
//             //         .headline5
//             //         .copyWith(fontFamily: "DMSans"),
//             //   ),
//             // ),
//             Center(
//           child: Expanded(
//             child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Container(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: Container(
//                               alignment: Alignment.center,
//                               height: 44,
//                               width: 44,
//                               decoration: const BoxDecoration(
//                                 color: Colors.black,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: IconButton(
//                                 onPressed: () => speak(),
//                                 icon: Icon(Icons.play_arrow_rounded),
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(17),
//                             child: Text(
//                               question,
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   //fontWeight: FontWeight.bold,
//                                   fontFamily: "DMSans"),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FutureBuilder<List<ToxicityInfo>>(
//                     future: futureData,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         List<ToxicityInfo> data = snapshot.data;
//                         return GridView.builder(
//                             itemCount: snapshot.data.length,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               childAspectRatio: 1.2,
//                             ),
//                             itemBuilder: (BuildContext context, int index) {
//                               return SampleAvatar(
//                                 imag: data[index].img,
//                                 tox: data[index].name,
//                                 press: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => TestDig())),
//                               );
//                             });
//                       } else if (snapshot.hasError) {
//                         return Text("Error");
//                       }
//                       return Text('');
//                       //     CircularProgressIndicator(
//                       //   color: Color(0xFF26d3ba),
//                       // );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         // Expanded(
//         //   child: FutureBuilder<List<ToxicityInfo>>(
//         //     future: futureData,
//         //     builder: (context, snapshot) {
//         //       if (snapshot.hasData) {
//         //         List<ToxicityInfo> data = snapshot.data;
//         //         return GridView.builder(
//         //             itemCount: snapshot.data.length,
//         //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         //               crossAxisCount: 2,
//         //               childAspectRatio: 1.2,
//         //             ),
//         //             itemBuilder: (BuildContext context, int index) {
//         //               return SampleAvatar(
//         //                 imag: data[index].img,
//         //                 tox: data[index].name,
//         //                 press: () => Navigator.push(
//         //                     context,
//         //                     MaterialPageRoute(
//         //                         builder: (context) => TestDig())),
//         //               );
//         //             });
//         //       } else if (snapshot.hasError) {
//         //         return Text("Error");
//         //       }
//         //       return Text('...');
//         //       // CircularProgressIndicator(
//         //       //   color: Color(0xFF26d3ba),
//         //       // );
//         //     },
//         //   ),
//         // )

//         //   GridView.count(
//         // crossAxisCount: 2,
//         // childAspectRatio: 1.2,
//         // children: [
//         // SampleAvatar(
//         //   imag: 'assets/images/dig.jpeg',
//         //   tox: "Digestive",
//         //   press: () => Navigator.push(context,
//         //       MaterialPageRoute(builder: (context) => TestDig())),
//         // ),
//         // SampleAvatar(
//         //     imag: 'assets/images/gon.jpeg',
//         //     tox: "gonadique",
//         //     press: () {}),
//         // SampleAvatar(
//         //   imag: 'assets/images/gr1.jpeg',
//         //   tox: "cutanee",
//         //   press: () => Navigator.push(context,
//         //       MaterialPageRoute(builder: (context) => TestCut())),
//         // ),
//         // SampleAvatar(
//         //   imag: 'assets/images/neur.jpeg',
//         //   tox: "Neurologique",
//         //   press: () => Navigator.push(context,
//         //       MaterialPageRoute(builder: (context) => TestNeur())),
//         // ),
//         // SampleAvatar(
//         //     imag: 'assets/images/arth.jpeg',
//         //     tox: "Arthromyalgique ",
//         //     press: () {}),
//         // SampleAvatar(
//         //     imag: 'assets/images/eye.jpeg',
//         //     tox: "oculaire",
//         //     press: () {}),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }

// class SampleAvatar extends StatelessWidget {
//   final String imag;
//   final String tox;
//   final VoidCallback press;
//   SampleAvatar({
//     Key key,
//     @required this.imag,
//     @required this.tox,
//     @required this.press,
//   }) : super(key: key);
//   int selected = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       //width: c_width,
//       margin: const EdgeInsets.all(14),
//       //padding: const EdgeInsets.all(6),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.23),
//             spreadRadius: -4,
//             blurRadius: 10,
//             offset: const Offset(0, 1), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Material(
//         //borderRadius: BorderRadius.circular(8),
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: press,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             //crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Image.asset(
//                 imag,
//                 width: 120,
//               ),
//               /*Container(
//                   child: Padding(
//                 padding: const EdgeInsets.only(bottom: 7),
//                 child: Image.asset(
//                   imag,
//                   //width: 100,
//                 ),
//               )),*/
//               Spacer(),
//               //const Spacer(),
//               Text(tox, style: TextStyle(fontFamily: "DMSans", fontSize: 15))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pfe/api/login_api.dart';
import 'package:pfe/model/toxicity_model.dart';

import '../logged_in/componants/test_dig.dart';

// Future<List<Data>> fetchData() async {
//   final response = await http.get('http://192.168.1.110:9000/api/welcomeinfo');
//   if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body);
//     return jsonResponse.map((data) => new Data.fromJson(data)).toList();
//   } else {
//     throw Exception('Unexpected error occured!');
//   }
// }

// class Data {
//   int id;
//   String name;
//   String description;
//   String img;

//   Data({String img, int id, String name, String description});

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       id: json['id'],
//       description: json['description'],
//       name: json['name'],
//       img: json['img'],
//     );
//   }
// }

//void main() => runApp(MyApp());
Future<List<ToxicityInfo>> fetchData() async {
  var res = await CallApi().getData('welcomeinfo');
  //final response = await http.get('http://192.168.1.110:9000/api/welcomeinfo');
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    return jsonResponse.map((data) => new ToxicityInfo.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Try3 extends StatefulWidget {
  Try3({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Try3> {
  Future<List<ToxicityInfo>> futureData;
  var toxicities = <ToxicityInfo>[];

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            title: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.23),
                    spreadRadius: -4,
                    blurRadius: 10,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: const TextField(
                  decoration: InputDecoration(
                hintText: "search",
                hintStyle: TextStyle(fontFamily: "DMSans"),
                icon: Icon(
                  Icons.search,
                  color: Color(0xFF26d3ba),
                ),
                border: InputBorder.none,
              )),
            ),
          ),
        ),
        body: Center(
          child: FutureBuilder<List<ToxicityInfo>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ToxicityInfo> data = snapshot.data;
                return GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return SampleAvatar(
                        imag: data[index].img,
                        tox: data[index].name,
                        press: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TestDig())),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("Error");
              }
              return //Text('');
                  CircularProgressIndicator(
                color: Color(0xFF26d3ba),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SampleAvatar extends StatelessWidget {
  final String imag;
  final String tox;
  final VoidCallback press;
  SampleAvatar({
    Key key,
    @required this.imag,
    @required this.tox,
    @required this.press,
  }) : super(key: key);
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //width: c_width,
      margin: const EdgeInsets.all(14),
      //padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.23),
            spreadRadius: -4,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        //borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                imag,
                width: 120,
              ),
              /*Container(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Image.asset(
                  imag,
                  //width: 100,
                ),
              )),*/
              Spacer(),
              //const Spacer(),
              Text(tox, style: TextStyle(fontFamily: "DMSans", fontSize: 15))
            ],
          ),
        ),
      ),
    );
  }
}

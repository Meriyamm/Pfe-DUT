import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilyapp/Models/user_patient.dart';
import 'package:mobilyapp/bilan.dart';
import 'package:mobilyapp/widgets/patientInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Models/patients.dart';
import '../api/login_api.dart';

class zonepatient extends StatelessWidget {
  const zonepatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: cardpatient(),
      ),
    );
  }
}

class cardpatient extends StatefulWidget {
  const cardpatient({Key? key}) : super(key: key);

  @override
  State<cardpatient> createState() => _cardpatientState();
}

class _cardpatientState extends State<cardpatient> {
  var articles = <PatientInfo>[];
  // late String name;

  @override
  void initState() {
    _initData();
    // _userDetails();
    super.initState();
  }

  _getArticles() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");
    await _initData();
  }

  _initData() async {
    String myUrl = 'patients';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    List Result;
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.get(Uri.parse(_url), headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }).then((response) {
      if (response.statusCode == 200) {
        print(response.body);
        //List jsonResponse = json.decode(response.body);
        setState(() {
          List jsonResponse = json.decode(response.body)['data'];
          articles = jsonResponse
              .map((data) => new PatientInfo.fromJson(data))
              .toList();
        });
        print(articles);
      } else {
        throw Exception('Unexpected error occured!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: articles.length == 0
          ? CircularProgressIndicator(
              color: Color.fromARGB(255, 69, 180, 164),
            )
          : Column(
              children: articles.map((e) {
              return Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientMore(
                            name: e.name, ip: e.ip, age: e.age, sexe: e.sexe),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0 * 0.75),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    AssetImage('assets/images/Anonym.jpeg')),
                          ],
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                // SizedBox(
                                //   height: 8,
                                // ),
                                // Opacity(
                                //   opacity: 0.64,
                                //   child: Text(
                                //     user.lasttime,
                                //     maxLines: 1,
                                //     overflow: TextOverflow.ellipsis,
                                //   ),
                                // )
                              ]),
                        )),
                      ],
                    ),
                  ),
                ),
              );
            }).toList()),
    ));
  }
}

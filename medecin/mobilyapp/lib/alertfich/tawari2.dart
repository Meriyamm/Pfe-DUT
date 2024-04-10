import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobilyapp/alertfich/dialogue_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Models/bilan_model.dart';
import '../api/login_api.dart';

class tawari2 extends StatelessWidget {
  const tawari2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Alerts'),
        backgroundColor: Colors.red,
      ),
      body: west(),
    );
  }
}

class west extends StatefulWidget {
  const west({Key? key}) : super(key: key);

  @override
  State<west> createState() => _westState();
}

class _westState extends State<west> {
  var bilans = <BilanInfo>[];
  // late String name;
  @override
  void initState() {
    _initData();
    super.initState();
  }

  _initData() async {
    String myUrl = 'bilan';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.get(Uri.parse(_url), headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }).then((response) {
      if (response.statusCode == 200) {
        // print(response.body);
        var body = json.decode(response.body);
        //List jsonResponse = json.decode(response.body);
        setState(() {
          // print(body['bilan']);
          // name = json.decode(response.body)['name'];
          List jsonResponse = json.decode(response.body)['bilan'];
          bilans =
              jsonResponse.map((data) => new BilanInfo.fromJson(data)).toList();
          print(bilans);
        });
        print(bilans);
      } else {
        throw Exception('Unexpected error occured!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: bilans.length == 0
            ? CircularProgressIndicator(
                color: Colors.red,
              )
            : Column(
                children: bilans.map((bilan) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                          leading: CircleAvatar(
                            backgroundColor: bilan.grade == 1
                                ? Colors.green
                                : bilan.grade == 2
                                    ? Color.fromARGB(255, 212, 198, 65)
                                    : Colors.red,
                            radius: 20,
                            child: Icon(
                              Icons.flag,
                              size: 15,
                              color: Colors.white60,
                            ),
                          ),
                          title: Text(bilan.user),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => facealert(
                                    id: bilan.id,
                                    tox: bilan.tox,
                                    symp: bilan.symp,
                                    img: bilan.img,
                                    grade: bilan.grade,
                                    created_at: bilan.created_at,
                                    user: bilan.user),
                              ),
                            );
                          },
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }).toList(),

                // SizedBox(
                //   height: 20,
                // ),
                // ListTile(
                //     leading: CircleAvatar(
                //       backgroundColor: Colors.red,
                //       radius: 20,
                //       child: Icon(
                //         Icons.flag,
                //         size: 15,
                //         color: Colors.white60,
                //       ),
                //     ),
                //     title: Text('patient 2 name'),
                //     onTap: () {},
                //     trailing: Icon(
                //       Icons.arrow_forward_ios,
                //       size: 18,
                //     )),
                // SizedBox(
                //   height: 20,
                // ),
                // ListTile(
                //     leading: CircleAvatar(
                //       backgroundColor: Colors.red,
                //       radius: 20,
                //       child: Icon(
                //         Icons.flag,
                //         size: 15,
                //         color: Colors.white60,
                //       ),
                //     ),
                //     title: Text('patient 3 name'),
                //     onTap: () {},
                //     trailing: Icon(
                //       Icons.arrow_forward_ios,
                //       size: 18,
                //     )),
                // SizedBox(
                //   height: 20,
                // ),
                // ListTile(
                //     leading: CircleAvatar(
                //       backgroundColor: Colors.green,
                //       radius: 20,
                //       child: Icon(
                //         Icons.flag,
                //         size: 15,
                //         color: Colors.white60,
                //       ),
                //     ),
                //     title: Text('patient 4 name'),
                //     onTap: () {},
                //     trailing: Icon(
                //       Icons.arrow_forward_ios,
                //       size: 18,
                //     )),
                // SizedBox(
                //   height: 20,
                // ),
                // ListTile(
                //     leading: CircleAvatar(
                //       backgroundColor: Colors.yellow,
                //       radius: 20,
                //       child: Icon(
                //         Icons.flag,
                //         size: 15,
                //         color: Colors.white60,
                //       ),
                //     ),
                //     title: Text('patient 5 name'),
                //     onTap: () {},
                //     trailing: Icon(
                //       Icons.arrow_forward_ios,
                //       size: 18,
                //     )),
                // SizedBox(
                //   height: 20,
                // ),
              ));
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobilyapp/accountdoctor/compte.dart';
import 'package:mobilyapp/alertfich/tawari2.dart';
import 'package:mobilyapp/connection/login.dart';
import 'package:mobilyapp/patients/interface_patient.dart';
import 'package:mobilyapp/widgets/postcontainer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Models/post_models.dart';
import '../Models/posts_model.dart';
import '../api/login_api.dart';
import '../data/mydata.dart';
import '../welcom/Ahlan.dart';

class face1 extends StatefulWidget {
  const face1({Key? key}) : super(key: key);

  @override
  State<face1> createState() => _face1State();
}

class _face1State extends State<face1> {
  var articles = <PostInfo>[];
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

  // _userDetails() async {
  //   var res = await CallApi().getData('user');
  //   var body = json.decode(res.body);
  //   // var doctor = json.decode(body.doctor);
  //   print(body);
  //   print(body['success']);
  //   if (body['success']) {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     setState(() {
  //       name = body['name'];
  //     });

  //     // CreateDialog(context, body['name']);
  //   } else {
  //     //_showMsg(body['message']);
  //     print('something is wrong');
  //   }
  // }

  _initData() async {
    String myUrl = 'allposts';
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

          articles =
              jsonResponse.map((data) => new PostInfo.fromJson(data)).toList();
        });
        print(articles);
      } else {
        throw Exception('Unexpected error occured!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navbar(),
      appBar: AppBar(
        title: Text('Hello, Doctor'),
        backgroundColor: Color.fromARGB(255, 42, 102, 110),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    fillColor: CupertinoColors.secondarySystemFill,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Image.asset(
                            "assets/images/srch.png",
                            height: 25,
                          ),
                        ))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Posts',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: articles.length == 0
                    ? CircularProgressIndicator(
                        color: Color.fromARGB(255, 69, 180, 164),
                      )
                    : Column(
                        children: articles.map((article) {
                          //debugPrint(article.img.toString());
                          return GestureDetector(
                              onTap: () {},
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        //padding: const EdgeInsets.all(17),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.23),
                                              spreadRadius: -4,
                                              blurRadius: 10,
                                              offset: const Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                                Icons.person),
                                                            iconSize: 30,
                                                          ),
                                                          Text(
                                                            article.user,
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "DMSans"),
                                                            //textAlign: TextAlign.left,
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        article.created_at,
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "DMSans"),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      article.content,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          fontFamily: "DMSans"),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 8),
                                                        child: PostButton(
                                                            icon: Icon(
                                                              MdiIcons
                                                                  .commentOutline,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      166,
                                                                      236,
                                                                      245),
                                                              size: 15.0,
                                                            ),
                                                            label: 'Comment',
                                                            onTap: () => print(
                                                                'Comment')),
                                                      ),
                                                      // Text(
                                                      //   // article.nbComment
                                                      //   //         .toString() +
                                                      //   " comments",
                                                      //   style: const TextStyle(
                                                      //       color: Colors.grey,
                                                      //       fontFamily:
                                                      //           "DMSans"),
                                                      // ),
                                                      const Spacer(),
                                                      // IconButton(
                                                      //     onPressed: () {},
                                                      //     icon: Icon(
                                                      //       Icons.favorite,
                                                      //       size: 30,
                                                      //       color: Color(0xff25ccb7),
                                                      //     )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )));
                        }).toList(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  late String name = '';
  late String email = '';
  @override
  void initState() {
    _initData();
    // _userDetails();
    // name = 'htht';
    // email = 'ejjff';
    super.initState();
  }

  _userDetails() async {
    var res = await CallApi().getData('user');
    var body = json.decode(res.body);
    // var doctor = json.decode(body.doctor);
    print(body);
    print(body['success']);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      setState(() {
        name = body['name'];
        email = body['email'];
      });

      // CreateDialog(context, body['name']);
    } else {
      //_showMsg(body['message']);
      print('something is wrong');
    }
  }

  _initData() async {
    String myUrl = 'user';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    List Result;
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    print(value);
    http.get(Uri.parse(_url), headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }).then((response) {
      if (response.statusCode == 200) {
        print(response.statusCode);
        //List jsonResponse = json.decode(response.body);
        setState(() {
          name = json.decode(response.body)['name'];
          email = json.decode(response.body)['email'];
        });

        // List jsonResponse = json.decode(response.body);
      } else {
        throw Exception('Unexpected error occured!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return name == null || email == null
        ? CircularProgressIndicator(
            color: Color(0xFF26d3ba),
          )
        : Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: name != null ? Text(name) : Text(''),
                  accountEmail: email != null ? Text(email) : Text(''),
                  currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                    child: Image.asset('assets/images/doc.jpeg'),
                  )),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Patients'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => patient(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('My account '),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => compte()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Alert'),
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '5',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => tawari2()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.outbox),
                  title: Text('Log out '),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}

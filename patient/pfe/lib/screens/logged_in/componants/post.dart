// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pfe/screens/logged_in/logged_in.dart';
import 'package:pfe/screens/logged_in/posts.dart';
import 'package:pfe/screens/logged_in/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../api/login_api.dart';

class PostAdd extends StatefulWidget {
  PostAdd({Key key}) : super(key: key);
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<PostAdd> {
  @override
  void initState() {
    super.initState();
  }

  int count = 0;

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(
        msg,
        style: TextStyle(fontFamily: "DMSans"),
      ),
      action: SnackBarAction(
        label: 'أغلق',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextEditingController postController = TextEditingController();
  _Post() async {
    //var res = await CallApi().getData('posts');
    String myUrl = 'posts';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';

    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    if (postController.text == "") {
      CreateDialog(context,'!!!كتب سؤال');
    } else {
      http.post(_url, headers: {
        'Accept': 'application/json',
        'Authorization': "Bearer $value",
      }, body: {
        'content': postController.text
      }).then((response) {
        if (response.statusCode == 201) {
          print('Response body : ${response.body}');
          // return 'Response body : ${response.body}';
          CreateDialog(context, 'أضيف بنجاح');
        } else {
          //print('error');
          print('Response body : ${response.body}');
          print(response.statusCode);
        }
      });
    }
  }

  CreateDialog(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                // title: Text(
                //   text,
                //   style: TextStyle(color: Colors.black, fontSize: 18),
                // ),
                content: Text(text),
                actions: <Widget>[
                  TextButton(
                      onPressed: (() =>
                          //Navigator.of(context).popUntil((_) => count++ >= 2)),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoggedIn(),
                                //Questionnaire()
                                // LoggedIn(),
                              ))),
                      child: Text('اوكي')),
                  // TextButton(
                  //     onPressed: (() => Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => PostAdd(),
                  //           //Questionnaire()
                  //           // LoggedIn(),
                  //         ))),
                  //     child: Text('cancel')),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247)),
        home: Scaffold(
            body: Stack(children: <Widget>[
          /*Container(
                  height: size.height * .30,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Color(0xFF0f3c78),
                    Color(0xFF26d3ba)
                  ]))),*/
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      'assets/icons/x.png',
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "منشور جديد",
                              style:
                                  TextStyle(fontFamily: "DMSans", fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                ': سؤالك  ',
                                style: TextStyle(
                                    fontFamily: 'DMSans', fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            controller: postController,

                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'اكتب هنا',
                            ),
                            keyboardType: TextInputType.multiline,
                            minLines:
                                5, //Normal textInputField will be displayed
                            maxLines: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _Post();
                                },
                                child: Icon(Icons.add),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 69, 180, 164),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ))
            ]),
          ))
        ])));
  }
}

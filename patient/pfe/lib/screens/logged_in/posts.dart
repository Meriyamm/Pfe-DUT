import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe/model/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:pfe/screens/logged_in/componants/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/login_api.dart';
import '../../components/text_widget.dart';
import '../anonyme/componants/nav_bar.dart';
import 'componants/detailpost.dart';

class AllPosts extends StatefulWidget {
  const AllPosts({Key key}) : super(key: key);

  @override
  _AllPostsState createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  var articles = <PostInfo>[];
  String name;

  @override
  void initState() {
    _initData();
    super.initState();
  }

  _getArticles() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");
    await _initData();
  }

  _initData() async {
    String myUrl = 'posts';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    List Result;
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.get(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }).then((response) {
      if (response.statusCode == 200) {
        //List jsonResponse = json.decode(response.body);
        setState(() {
          List jsonResponse = json.decode(response.body)['data'];
          name = json.decode(response.body)['user'];
          print(name);
          articles =
              jsonResponse.map((data) => new PostInfo.fromJson(data)).toList();
        });
        print(articles);
      } else {
        throw Exception('Unexpected error occured!');
      }
    });
  }

  delete(int index) async {
    //var res = await CallApi().getData('posts');
    String myUrl = 'posts/${index}';
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    String _url = CallApi().getUrl(myUrl);
    final value = prefs.get(key) ?? 0;
    http.delete(_url, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $value",
    }).then((response) {
      if (response.statusCode == 200) {
        print('Response body : ${response.body}');
      }
    });
    await _initData();
  }

  CreateDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                content: Text('هل أنت متأكد أنك تريد حذف هذا السؤال؟'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        delete(index);
                        _initData();
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text('آه')),
                  TextButton(
                      onPressed: (() => Navigator.pop(context)),
                      child: Text('لا')),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 247, 247, 247),
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => PostAdd()))),
                  child: const Text(
                    '+',
                    style: TextStyle(fontFamily: "DMSans", fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 69, 180, 164),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'منشورات',
                  style: TextStyle(fontFamily: "DMSans", fontSize: 20),
                ),
                //r Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 15,
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPostPage(
                                          content: article.content,
                                          user: name,
                                          date: article.created_at,
                                          index: article.id)));
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                height: 250,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      //padding: const EdgeInsets.all(17),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.23),
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
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailPostPage(
                                                          com : article.nbComment.toString(),
                                                            content:
                                                                article.content,
                                                            user: name,
                                                            date: article
                                                                .created_at,
                                                            index:
                                                                article.id)));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
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
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                              Icons.person),
                                                          iconSize: 30,
                                                        ),
                                                        Text(
                                                          name,
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
                                                          fontFamily: "DMSans"),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8),
                                                      child: Image.asset(
                                                        "assets/icons/comment.png",
                                                        width: 25,
                                                      ),
                                                    ),
                                                    Text(
                                                      article.nbComment
                                                              .toString() +
                                                          " comments",
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: "DMSans"),
                                                    ),
                                                    const Spacer(),
                                                    // IconButton(
                                                    //     onPressed: () {},
                                                    //     icon: Icon(
                                                    //       Icons.favorite,
                                                    //       size: 30,
                                                    //       color: Color(0xff25ccb7),
                                                    //     )),

                                                    IconButton(
                                                        onPressed: () {
                                                          CreateDialog(context,
                                                              article.id);
                                                        },
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color:
                                                              Color(0xff1fa5a6),
                                                          size: 30,
                                                        ))
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
      )),
    ));
  }
}

class post extends StatelessWidget {
  //FlutterTts flutterTts = FlutterTts();
  final String user;
  final String cont;
  final String date;
  final String numcom;
  final VoidCallback press;
  post({
    Key key,
    @required this.user,
    @required this.cont,
    @required this.date,
    @required this.numcom,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future speak() async {
    //   await flutterTts.setLanguage("en-US");
    //   //print(await flutterTts.getLanguages);
    //   await flutterTts.speak(cont);
    // }

    double c_width = MediaQuery.of(context).size.width * 0.8;
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: const EdgeInsets.all(10),
          //padding: const EdgeInsets.all(17),
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
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.person),
                              iconSize: 30,
                            ),
                            Text(
                              user,
                              style:
                                  TextStyle(fontSize: 16, fontFamily: "DMSans"),
                              //textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          date,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "DMSans"),
                        ),
                      ],
                    ),
                    //Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cont,
                        maxLines: 2,
                        style: const TextStyle(fontFamily: "DMSans"),
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        //onPressed: () => speak(),
                        icon: Icon(Icons.play_arrow_rounded),
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Text(
                          numcom + " comments",
                          style: const TextStyle(
                              color: Colors.grey, fontFamily: "DMSans"),
                        ),
                        const Spacer(),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       Icons.favorite,
                        //       size: 30,
                        //       color: Color(0xff25ccb7),
                        //     )),
                        // Image.asset(
                        //   "assets/icons/comment.png",
                        //   width: 25,
                        // ),
                        IconButton(
                            onPressed: press,
                            icon: const Icon(
                              Icons.delete,
                              color: Color(0xff1fa5a6),
                              size: 30,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

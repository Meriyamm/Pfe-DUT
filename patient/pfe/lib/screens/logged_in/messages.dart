import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../api/login_api.dart';
import '../../model/login_model.dart';
import '../../model/posts_model.dart';
import '../anonyme/componants/nav_bar.dart';
import 'componants/profil.dart';
import 'home_screen.dart';

Future<List<PostInfo>> fetchData() async {
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
      List jsonResponse = json.decode(response.body)['data'];
      // List map = jsonResponse['data'];
      //print(map[2]);
      print(jsonResponse);
      //print(map);
      Result = jsonResponse.map((data) => new PostInfo.fromJson(data)).toList();
      // List jsonResponse = json.decode(response.body);
      print(Result);
      // print(jsonResponse.map((data) => PostInfo.fromJson(data)).toList());
      // return jsonResponse.map((data) => PostInfo.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  });
  return Result;
  // var res = await CallApi().getData2('posts');
  // //final response = await http.get('http://192.168.1.110:9000/api/welcomeinfo');
  // if (res.statusCode == 200) {
  //   //List jsonResponse = json.decode(res.body);
  //   Map<String, dynamic> jsonResponse = json.decode(res.body);
  //   List map = jsonResponse['data'];

  //   print(map[0]['created_at']);

  //   //print(map);

  //   return map.map((data) => new PostInfo.fromJson(data)).toList();
  //   // List jsonResponse = json.decode(res.body);
  //   // print(res.body);
  //   // return jsonResponse.map((data) => PostInfo.fromJson(data)).toList();
  // } else {
  //   throw Exception('Unexpected error occured!');
  // }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  _ChatState createState() => _ChatState();
}

class _ChatState extends State<ChatScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<PostInfo>> futureData;

  void initState() {
    super.initState();
    futureData = fetchData();
    //futureCure = PostCure();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      // drawer: NavBar(),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(70.0),
      //   child: AppBar(
      //     flexibleSpace: Container(
      //       decoration: const BoxDecoration(
      //         //   gradient: LinearGradient(colors: <Color>[
      //         // Color(0xFF0f3c78),
      //         // Color(0xFF26d3ba),
      //         color: Colors.white,
      //       ),
      //     ),
      //     leading: Padding(
      //       padding: const EdgeInsets.only(top: 8, left: 8),
      //       child: Container(
      //         alignment: Alignment.center,
      //         height: 52,
      //         width: 52,
      //         decoration: const BoxDecoration(
      //           color: Color.fromARGB(131, 177, 241, 232),
      //           shape: BoxShape.circle,
      //         ),
      //         child: IconButton(
      //           icon: Image.asset('assets/icons/menu3.png'),
      //           color: Colors.white,
      //           onPressed: () => Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => ProfileScreen())),
      //           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      body: Center(
        child: FutureBuilder<List<PostInfo>>(
          future: futureData,
          builder: (context, snapshot) {
            Widget postList;
            if (snapshot.hasData) {
              List<PostInfo> data = snapshot.data;
              print(data);
              // //return
              // print('success');
              postList = SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.5,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  // Future<List<UserModel>> fetchData2() async {
                  //   var res = await CallApi()
                  //       .getData('user/' + data[index].id.toString());
                  //   //final response = await http.get('http://192.168.1.110:9000/api/welcomeinfo');
                  //   if (res.statusCode == 200) {
                  //     List jsonResponse = json.decode(res.body);
                  //     return jsonResponse
                  //         .map((data) => new UserModel.fromJson(data))
                  //         .toList();
                  //   } else {
                  //     throw Exception('Unexpected error occured!');
                  //   }
                  // }
                  //print(snapshot.data.length);
                  return post(
                    user: 'Me',
                    //cont: data[index].content.toString(),
                    numcom: "5",
                    //date: data[index].created_at.toString(),
                    press: () {},
                    cont: 'ehhehehe',
                    date: 'dhdhfhfd',
                  );
                }, childCount: snapshot.data.length),
              );
            } else if (snapshot.hasError) {
              // return Text("Error");
              postList = SliverToBoxAdapter(
                child: Text(snapshot.error.toString()),
                // CircularProgressIndicator(
                //   color: Color(0xFF26d3ba),
                // ),
              );
            }
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      // Container(
                      //     height: size.height * .01,
                      //     decoration: const BoxDecoration(
                      //         gradient: LinearGradient(colors: <Color>[
                      //       Color(0xFF0f3c78),
                      //       Color(0xFF26d3ba),
                      //     ]))),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.23),
                              spreadRadius: -4,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                      fontFamily: "DMSans", fontSize: 20),
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
                                style: TextStyle(
                                    fontFamily: "DMSans", fontSize: 25),
                              ),
                              //r Spacer(),
                            ],
                          ),
                        ),
                      ]),
                ),
                postList,
              ],
            );
          },
        ),
      ),
      //   ],
      // )),
    );
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
          //height: double.infinity,
          //width: double.infinity,
          //width: c_width,
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
                        Image.asset(
                          "assets/icons/comment.png",
                          width: 25,
                        )
                        /*IconButton(
                          onPressed: press,
                          icon: const Icon(
                            Icons.comment,
                            color: Color(0xff1fa5a6),
                            size: 30,
                          ))*/
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
// body: Stack(
//           children: <Widget>[
//             SafeArea(
//                 child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 52,
//                       width: 52,
//                       decoration: const BoxDecoration(
//                         color: Color.fromARGB(131, 177, 241, 232),
//                         shape: BoxShape.circle,
//                       ),
//                       child: IconButton(
//                         icon: Image.asset('assets/icons/menu3.png'),
//                         color: Colors.white,
//                         onPressed: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ProfileScreen())),
//                         tooltip: MaterialLocalizations.of(context)
//                             .openAppDrawerTooltip,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 18, horizontal: 20),
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(29.5),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.23),
//                           spreadRadius: -4,
//                           blurRadius: 10,
//                           offset:
//                               const Offset(0, 1), // changes position of shadow
//                         ),
//                       ],
//                     ),
//                     child: const TextField(
//                         decoration: InputDecoration(
//                       hintText: "search",
//                       hintStyle: TextStyle(fontFamily: "DMSans"),
//                       icon: Icon(
//                         Icons.search,
//                         color: Color(0xFF26d3ba),
//                       ),
//                       border: InputBorder.none,
//                     )),
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         color: const Color(0xff25ccb7),
//                         child: Text(
//                           'All',
//                           style: TextStyle(
//                               color: Colors.white, fontFamily: 'DMSans'),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ))
//           ],
//         )
import 'package:flutter/material.dart';

class DetailPostPage extends StatefulWidget {
  final int index;
  final String content;
  final String user;
  final String date;
  final String com;
  const DetailPostPage(
      {Key key,
      @required this.index,
      @required this.com,
      @required this.content,
      @required this.user,
      @required this.date})
      : super(key: key);

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                  Expanded(
                      child: ClipRRect(
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
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),

                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                widget.user,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "DMSans"),
                                                //textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.date,
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
                                          widget.content,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontFamily: "DMSans"),
                                        ),
                                      ),

                                      // Container(
                                      //   alignment: Alignment.center,
                                      //   height: 40,
                                      //   width: 40,
                                      //   decoration: const BoxDecoration(
                                      //     color: Colors.black,
                                      //     shape: BoxShape.circle,
                                      //   ),
                                      //   child: IconButton(
                                      //     //onPressed: () => speak(),
                                      //     icon: Icon(Icons.play_arrow_rounded),
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
                                      // Spacer(),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            widget.com.toString() + " comments",
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
                                          // Image.asset(
                                          //   "assets/icons/comment.png",
                                          //   width: 25,
                                          // ),
                                          IconButton(
                                              onPressed: () {},
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
                          )))
                ]),
          ))
        ])));
  }
}

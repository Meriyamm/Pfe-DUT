import 'package:flutter/material.dart';

import 'componants/profil.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 247, 247, 247)),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 52,
                  //     width: 52,
                  //     decoration: const BoxDecoration(
                  //       color: Color.fromARGB(131, 177, 241, 232),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: IconButton(
                  //       icon: Image.asset('assets/icons/menu3.png'),
                  //       color: Colors.white,
                  //       onPressed: () => Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => ProfileScreen())),
                  //       tooltip: MaterialLocalizations.of(context)
                  //           .openAppDrawerTooltip,
                  //     ),
                  //   ),
                  // ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5),
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
                      child: const TextField(
                          decoration: InputDecoration(
                        hintText: "بحث",
                        hintStyle: TextStyle(fontFamily: "DMSans"),
                        icon: Icon(
                          Icons.search,
                          color: Color(0xFF26d3ba),
                        ),
                        border: InputBorder.none,
                      )),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "لا توجد إشعارات في الوقت الحالي",
                                style: TextStyle(
                                    color: Colors.grey, fontFamily: 'DMSans'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

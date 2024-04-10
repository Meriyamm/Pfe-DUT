import 'package:flutter/material.dart';
import 'package:pfe/screens/anonyme/componants/cutanee.dart';
import 'package:pfe/screens/anonyme/componants/digestive.dart';

import '../logged_in/test.dart';

class Result extends StatelessWidget {
  int grade;
  String symp;
  String tox;
  Result(
      {Key key, @required this.grade, @required this.symp, @required this.tox})
      : super(key: key);

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
            padding: const EdgeInsets.all(30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      'assets/icons/x.png',
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Test())),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        tox,
                        style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        symp,
                        style: TextStyle(fontFamily: "DMSans", fontSize: 23),
                      ),
                      // (tox == 'سمية الجهاز الهضمي' && tox == 'سمية الجلد')
                      //     ?
                      Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: grade == 1
                              ? Color.fromARGB(255, 101, 238, 238)
                              : grade == 2
                                  ? Color.fromARGB(255, 197, 182, 46)
                                  : Color.fromARGB(255, 223, 86, 76),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '-المرتبة -' + grade.toString(),
                          style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      // : Container(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: grade >= 3
                                ? Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/warning.png',
                                        width: 60,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          'خاصك تمشي الطبيب في اقرب وقت!!',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'DMSans',
                                              fontSize: 17),
                                        ),
                                      )
                                    ],
                                  )
                                : Text('')),
                      ),
                      grade == 2
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            tox == 'سمية الجهاز الهضمي'
                                                ? DigAdvice()
                                                : CutAdvice()));
                              },
                              child: Container(
                                  child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 17),
                                    width: 450,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        //shape: BoxShape.circle,
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
                                          )
                                        ]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => tox ==
                                                              'سمية الجهاز الهضمي'
                                                          ? DigAdvice()
                                                          : CutAdvice()));
                                            },
                                            icon: Icon(
                                              Icons.download,
                                              color: Colors.black,
                                              size: 35,
                                            )),
                                        Spacer(),
                                        Text(
                                          'وصفة طبية',
                                          style: TextStyle(
                                              fontFamily: "DMSans",
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            )
                          : Text(''),
                      //Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      tox == 'سمية الجهاز الهضمي'
                                          ? DigAdvice()
                                          : CutAdvice()));
                        },
                        child: Container(
                            child: Column(
                          children: [
                            Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 17),
                                    width: 450,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        //shape: BoxShape.circle,
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
                                          )
                                        ]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => tox ==
                                                              'سمية الجهاز الهضمي'
                                                          ? DigAdvice()
                                                          : CutAdvice()));
                                            },
                                            icon: Icon(
                                              Icons.arrow_left_rounded,
                                              color: Colors.black,
                                              size: 35,
                                            )),
                                        Spacer(),
                                        Text(
                                          'نصائح',
                                          style: TextStyle(
                                              fontFamily: "DMSans",
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  )
                                // : Container(),
                          ],
                        )),
                      ),
                      Spacer(),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          'أبلغ طبيبك المعالج عن السمية في العلاج التالي !!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 63, 14, 196),
                              fontFamily: 'DMSans',
                              fontSize: 16),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ))
            ]),
          ))
        ])));
  }
}

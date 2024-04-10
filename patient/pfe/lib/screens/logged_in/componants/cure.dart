import 'package:flutter/material.dart';
import 'package:pfe/screens/logged_in/test.dart';

class CureScreen extends StatelessWidget {
  const CureScreen({Key key}) : super(key: key);

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
                                  "Dernier Cure",
                                  style: TextStyle(
                                      fontFamily: "DMSans", fontSize: 30),
                                ),
                              ),
                              Text(
                                '2022-02-22',
                                style: TextStyle(
                                    fontFamily: 'DMSans', color: Colors.grey),
                              ),
                              Row(
                                children: [],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Details : ',
                                      style: TextStyle(
                                          fontFamily: 'DMSans', fontSize: 20),
                                    ),
                                    Spacer()
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Prescription : ',
                                      style: TextStyle(
                                          fontFamily: 'DMSans', fontSize: 20),
                                    ),
                                    Spacer()
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Protocole : ',
                                      style: TextStyle(
                                          fontFamily: 'DMSans', fontSize: 20),
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Ajouter',
                                        style: TextStyle(fontFamily: "DMSans"),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color.fromARGB(255, 69, 180, 164),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Text(
                                      '- Regime\n- Medicament des hormones',
                                      style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ))
                ]),
          ))
        ])));
  }
}

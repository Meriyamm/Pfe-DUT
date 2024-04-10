import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pfe/screens/logged_in/logged_in.dart';
import 'package:pfe/screens/logged_in/test.dart';

class GeneralTest extends StatelessWidget {
  FlutterTts flutterTts = FlutterTts();
  String question = "Presence de plainte?";
  bool isSelected = false;
  GeneralTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future speak() async {
      await flutterTts.setLanguage("fr-FR");
      //print(await flutterTts.getLanguages);
      await flutterTts.speak(question);
    }

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
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: IconButton(
                  //     icon: Padding(
                  //       padding: const EdgeInsets.all(5),
                  //       child: Image.asset(
                  //         'assets/icons/x.png',
                  //       ),
                  //     ),
                  //     color: Colors.white,
                  //     onPressed: () => Navigator.pop(context),
                  //     tooltip: MaterialLocalizations.of(context)
                  //         .openAppDrawerTooltip,
                  //   ),
                  // ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 44,
                                    width: 44,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: () => speak(),
                                      icon: Icon(Icons.play_arrow_rounded),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    question,
                                    style: TextStyle(
                                        fontFamily: "DMSans", fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/icons/like.png",
                                    )),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    if (isSelected == false) {
                                      isSelected = true;
                                    } else {
                                      isSelected = false;
                                    }
                                  },
                                  icon: isSelected
                                      ? Icon(
                                          Icons.thumb_down,
                                          color: Color(0xFF26d3ba),
                                        )
                                      : Icon(
                                          Icons.thumb_down,
                                          color: Colors.grey,
                                        ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Row(
                              children: <Widget>[
                                Spacer(),
                                IconButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoggedIn())),
                                    icon: Icon(
                                      Icons.verified_rounded,
                                      size: 60,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ]),
          ))
        ])));
  }
  // Widget Question(String name, String imag, bool isSelected, int index) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: ListTile(
  //       leading: Image.asset(
  //         imag,
  //         width: 90,
  //       ),
  //       title: Text(
  //         name,
  //         style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "DMSans"),
  //       ),
  //       trailing: isSelected
  //           ? Icon(
  //               Icons.check_circle,
  //               color: Color(0xFF26d3ba),
  //             )
  //           : Icon(
  //               Icons.check_circle_outline,
  //               color: Colors.grey,
  //             ),
  //       onTap: ()
  //       {
  //         // setState(() {
  //         //   symptomList2[index].isSelected = !symptomList2[index].isSelected;
  //         //   if (symptomList2[index].isSelected == true) {
  //         //     selectedSymp.add(Symptom(name, true, imag));
  //         //   } else if (symptomList2[index].isSelected == false) {
  //         //     selectedSymp.removeWhere(
  //         //         (element) => element.name == symptomList2[index].name);
  //           }
  //         });
  //       },
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pfe/screens/evaluation/eval_cut.dart';
import 'package:pfe/screens/logged_in/componants/ToxicityModel.dart';
import 'package:pfe/screens/logged_in/componants/begin_test.dart';

class TestCut extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TestCut> {
  List<Symptom> selectedSymp = List();
  FlutterTts flutterTts = FlutterTts();
  String question = "ختار وحدة من الأعراض";

  @override
  Widget build(BuildContext context) {
    Future speak() async {
      await flutterTts.setLanguage("fr-FR");
      //print(await flutterTts.getLanguages);
      await flutterTts.speak(question);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "جلدي",
            style: TextStyle(color: Colors.black, fontFamily: "DMSans"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(17),
                            child: Text(
                              question,
                              style: const TextStyle(
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: "DMSans"),
                            ),
                          ),
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
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: cutanee.length,
                            itemBuilder: (BuildContext context, int index) {
                              // return item
                              return Container(
                                margin: const EdgeInsets.all(9),
                                //padding: const EdgeInsets.all(6),
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
                                child: SympItem(
                                  cutanee[index].name,
                                  cutanee[index].imag,
                                  cutanee[index].isSelected,
                                  index,
                                ),
                              );
                            }),
                      ),
                    ),
                    // selectedSymp.length > 0
                    //     ? Padding(
                    //         padding: const EdgeInsets.symmetric(
                    //           horizontal: 25,
                    //           vertical: 10,
                    //         ),
                    //         child: SizedBox(
                    //           width: double.infinity,
                    //           child: RaisedButton(
                    //             color: Color(0xFF26d3ba),
                    //             child: Text(
                    //               "Start (${selectedSymp.length})",
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontFamily: "DMSans",
                    //                 fontSize: 18,
                    //               ),
                    //             ),
                    //             onPressed: () {
                    //               print(
                    //                   "Delete List Lenght: ${selectedSymp.length}");
                    //             },
                    //           ),
                    //         ),
                    //       )
                    //     : Container(),
                  ],
                ))));
  }

  Widget SympItem(String name, String imag, bool isSelected, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
            leading: Image.asset(
              imag,
              width: 90,
            ),
            title: Text(
              name,
              style:
                  TextStyle(fontWeight: FontWeight.w500, fontFamily: "DMSans"),
            ),
            // trailing: isSelected
            //     ? Icon(
            //         Icons.check_circle,
            //         color: Color(0xFF26d3ba),
            //       )
            //     : Icon(
            //         Icons.check_circle_outline,
            //         color: Colors.grey,
            //       ),
            onTap: () {
              setState(() {
                print(index);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EvalCut(id: index)));
              });
            }

            //     () {
            //   setState(() {
            //     symptomList2[index].isSelected = !symptomList2[index].isSelected;
            //     if (symptomList2[index].isSelected == true) {
            //       selectedSymp.add(Symptom(name, true, imag));
            //     } else if (symptomList2[index].isSelected == false) {
            //       selectedSymp.removeWhere(
            //           (element) => element.name == symptomList2[index].name);
            //     }
            //   });
            // },
            ),
      ),
    );
  }
}

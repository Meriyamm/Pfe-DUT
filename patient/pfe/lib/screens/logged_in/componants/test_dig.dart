import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:pfe/screens/evaluation/eval_dig.dart';
import 'package:pfe/screens/logged_in/componants/ToxicityModel.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'begin_test.dart';

class TestDig extends StatelessWidget {
  TestDig({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<TestDig>
//     with SingleTickerProviderStateMixin {
  AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)

  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  //AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<Symptom> selectedSymp = List();
  FlutterTts flutterTts = FlutterTts();
  String question = "ختار وحدة من الأعراض";
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   iconController = AnimationController(
  //       vsync: this, duration: Duration(milliseconds: 1000));

  //   // audioPlayer.open(
  //   //   const Audio('assets/sound/question.m4a'),
  //   //   autoStart: false,
  //   //   //showNotification: true
  //   // );
  // }

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
            "الجهاز الهضمي",
            style: TextStyle(color: Colors.black, fontFamily: "DMSans"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 10),
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
                          // GestureDetector(
                          //   onTap: () {
                          //     AnimateIcon();
                          //   },
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     height: 44,
                          //     width: 44,
                          //     decoration: const BoxDecoration(
                          //       color: Colors.black,
                          //       shape: BoxShape.circle,
                          //     ),
                          //     child: AnimatedIcon(
                          //       icon: AnimatedIcons.play_pause,
                          //       progress: iconController,
                          //       //size: 50,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
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
                            itemCount: symptomList1.length,
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
                                  name: symptomList1[index].name,
                                  imag: symptomList1[index].imag,
                                  isSelected: symptomList1[index].isSelected,
                                  index: index,
                                ),
                              );
                            }),
                      ),
                    ),
                    /*selectedSymp.length > 0
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                color: Color(0xFF26d3ba),
                                child: Text(
                                  "Start (${selectedSymp.length})",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DMSans",
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            BeginTest())),
                              ),
                            ),
                          )
                        : Container(),*/
                  ],
                ))));
  }

  // void AnimateIcon() {
  //   setState(() {
  //     isAnimated = !isAnimated;

  //     if (isAnimated) {
  //       iconController.forward();
  //       audioPlayer.play();
  //     } else {
  //       iconController.reverse();
  //       audioPlayer.pause();
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   iconController.dispose();
  //   audioPlayer.dispose();
  //   super.dispose();
  // }

}

class SympItem extends StatelessWidget {
  String name;
  String imag;
  bool isSelected;
  int index;
  SympItem({
    Key key,
    @required this.imag,
    @required this.index,
    @required this.isSelected,
    @required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Future speak() async {
    //   await flutterTts.setLanguage("fr-FR");
    //   print(await flutterTts.getLanguages);
    //   await flutterTts.speak(name);
    // }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.center,
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 218, 218, 218),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  //=> speak(),
                  icon: Icon(Icons.play_arrow_rounded),
                  color: Colors.black,
                  iconSize: 20,
                ),
              ),
            ),
            title: Row(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontFamily: "DMSans"),
                ),
                Spacer(),
                // Image.asset(
                //   imag,
                //   width: 90,
                // ),
              ],
            ),
            /*trailing: isSelected
              ? Icon(
                  Icons.check_circle,
                  color: Color(0xFF26d3ba),
                )
              : Icon(
                  Icons.check_circle_outline,
                  color: Colors.grey,
                ),*/
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => EvalDig(id: index))))

            // {
            //   setState(() {
            //     symptomList1[index].isSelected = !symptomList1[index].isSelected;
            //     if (symptomList1[index].isSelected == true) {
            //       selectedSymp.add(Symptom(name, true, imag));
            //     } else if (symptomList1[index].isSelected == false) {
            //       selectedSymp.removeWhere(
            //           (element) => element.name == symptomList1[index].name);
            //     }
            //   });
            // },
            ),
      ),
    );
  }
}

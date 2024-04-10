import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:pfe/api/login_api.dart';
import 'package:pfe/components/primary_buttons.dart';
import 'package:pfe/model/toxicity_model.dart';
import 'package:pfe/screens/anonyme/advice.dart';
import 'package:pfe/screens/logged_in/componants/ToxicityModel.dart';
import 'package:pfe/screens/logged_in/componants/test_dig.dart';
import 'package:pfe/screens/logged_in/componants/test_neur.dart';
import 'package:pfe/screens/logged_in/componants/test_Cut.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../logged_in/componants/begin_test.dart';

class Try1 extends StatefulWidget {
  Try1({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Try1> {
  FlutterTts flutterTts = FlutterTts();
  String question = "Choisissez la toxicité que \nvous voulez évaluer";

  //List<Symptom> selectedSymptoms = List();
  var toxicities = <ToxicityInfo>[];
  final _totalDots = 3;
  double _currentPosition = 0.0;
  @override
  void initState() {
    _initData();

    super.initState();
  }

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }

  String getCurrentPositionPretty() {
    return (_currentPosition + 1.0).toStringAsPrecision(2);
  }

  _initData() async {
    CallApi().getPublicData("welcomeinfo").then((response) {
      setState(() {
        // Iterable list = json.decode(response.body);
        // articles= list.map((model)=>ArticleInfo.fromJson(model)).toList();
      });
    });
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPosition = _currentPosition.ceilToDouble();
      // _updatePosition(max(--_currentPosition, 0));
      _updatePosition(index.toDouble());
      print(index);
      print(_currentPosition);
    });
  }

  //////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF333d94),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/dig.jpeg"),
                      fit: BoxFit.fill)),
            ),
            _buildRow([
              DotsIndicator(
                dotsCount: _totalDots,
                position: _currentPosition,
                axis: Axis.horizontal,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                onTap: (pos) {
                  setState(() => _currentPosition = pos);
                },
              )
            ]),
            Container(
              height: 180,
              color: Color(0xFF333d94),
              child: PageView.builder(
                  onPageChanged: _onPageChanged,
                  controller: PageController(viewportFraction: 1.0),
                  itemCount: toxicities == null ? 0 : toxicities.length,
                  itemBuilder: (_, i) {
                    return Container(
                      height: 180,
                      padding:
                          const EdgeInsets.only(top: 50, left: 50, right: 50),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 10),
                      child: Text(
                        toxicities[i].name == null
                            ? "Nothing "
                            : toxicities[i].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                    height: 80,
                    bottom: 80,
                    left: (MediaQuery.of(context).size.width - 200) / 2,
                    right: (MediaQuery.of(context).size.width - 200) / 2,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BeginTest()));
                        },
                        child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFF7179ed),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 26),
                                ),
                              ],
                            ))))
              ],
            ))
          ],
        ));
  }
}

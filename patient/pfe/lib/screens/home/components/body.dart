import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:pfe/Services/globals.dart';
import 'package:pfe/components/primary_buttons.dart';
import 'package:pfe/constants.dart';
import 'package:pfe/screens/anonyme/advice.dart';
import 'package:pfe/screens/anonyme/ano_screen.dart';
import 'package:pfe/screens/logged_in/componants/general_health.dart';
import 'package:pfe/screens/logged_in/componants/profil.dart';
import 'package:pfe/screens/logged_in/general_state.dart';
import 'package:pfe/screens/logged_in/logged_in.dart';

//import 'package:pfe/screens/logged_in/logged_in.dart';
import '../../../api/login_api.dart';
import '../../try_outs.dart/question.dart';
import 'background_home.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  String ip = '';
  TextEditingController ipController = TextEditingController();
  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF363f93),
      content: Text(
        msg,
        style: const TextStyle(fontFamily: "DMSans"),
      ),
      action: SnackBarAction(
        label: 'أغلق',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login() async {
    var data = {
      'ip': ipController.text,
      'password': textController.text,
    };
    if (ipController.text == "" || textController.text == "") {
      _showMsg("الرجاء إدخال اسم المستخدم وكلمة المرور");
    } else {
      var res = await CallApi().postData(data, 'patient/login');
      var body = json.decode(res.body);
      print(body['success']);

      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        //print(localStorage.setString('token', body['token']));
        print(body['token']);
        var name = body['name'];

        print(name);

        localStorage.setString('user', json.encode(body['user']));

        CreateDialog(context, body['name']);
      } else {
        //_showMsg(body['message']);
        _showMsg('أدخل اسم مستخدم وكلمة مرور صالحين');
      }
    }
  }

  Future<String> CreateDialog(BuildContext context, String name) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                title: Text(
                  'مرحبا   "' + name + '"',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                content:
                    const Text('خاصنا نشخصو حالتك العامة. بغيتي تشخصها دبا؟'),
                actions: <Widget>[
                  TextButton(
                      onPressed: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoggedIn(),
                            //Questionnaire()
                            // LoggedIn(),
                          ))),
                      child: const Text('من بعد')),
                  TextButton(
                      onPressed: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GeneralHealth(),
                            //Questionnaire()
                            // LoggedIn(),
                          ))),
                      child: const Text('آه')),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          const Spacer(flex: 2),
          Image.asset(
            'assets/icons/logoc.png',
            // height: 123,
            width: 200,
          ),
          // Text(
          //   "م.عـَ.ك",
          //   style: TextStyle(
          //       fontSize: 24.0,
          //       fontStyle: FontStyle.italic,
          //       color: kTextColor,
          //       fontFamily: "DMSans"),
          // ),
          const Text(
            "متابعة العلاج الكيميائي",
            style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: kTextColor,
                fontFamily: "DMSans"),
          ),
          const Spacer(),
          Form(
            //key: formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: TextFormField(
                    controller: ipController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      //fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'رقم المريض',
                      labelStyle:
                          TextStyle(color: Colors.white, fontFamily: "DMSans"),
                      hoverColor: Colors.white,
                    ),
                    onSaved: (value) => ip = value,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  child: TextFormField(
                    controller: textController,
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "DMSans"),
                    decoration: const InputDecoration(
                      //fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'كلمة السر',
                      //hintText: "psw",
                      labelStyle:
                          TextStyle(color: Colors.white, fontFamily: "DMSans"),
                      hoverColor: Colors.white,
                    ),
                    onSaved: (value) => ip = value,
                  ),
                ),
                PrimaryButton(
                  text: 'تسجيل الدخول',
                  press: ()
                      // => Navigator.push(context,
                      //     MaterialPageRoute(builder: ((context) => LoggedIn())))

                      {
                    _login();
                  },
                ),
                const SizedBox(height: kDefaultPadding * 1.2),
              ],
            ),
          ),
          PrimaryButton(
              color: const Color(0xFF1a8297).withOpacity(0.75),
              textColor: Colors.white,
              text: 'زائر',
              press: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Advice()))),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/chu.png',
                height: 65,
              ),
              const Text(
                'المركز الاستشفائي الجامعي\n محمد السادس\n (مراكش)',
                style: TextStyle(fontFamily: 'DMSans', color: kTextColor),
              ),
              // Text(
              //   'Centre Hospitalier \nuniversitaire \nmohammed VI \nMarrakech',
              //   style: TextStyle(
              //       fontSize: 14.0, fontFamily: 'DMSans', color: kTextColor),
              // ),
            ],
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}

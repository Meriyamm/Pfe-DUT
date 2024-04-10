import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobilyapp/connection/button.dart';
import 'package:mobilyapp/connection/field.dart';
import 'package:mobilyapp/sidebar/inter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/login_api.dart';

class InputWrapper extends StatefulWidget {
  const InputWrapper({Key? key}) : super(key: key);

  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
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
        label: 'ok',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login() async {
    var data = {
      'email': ipController.text,
      'password': textController.text,
    };
    if (ipController.text == "" || textController.text == "") {
      _showMsg("Please enter an email and a password");
    } else {
      var res = await CallApi().postData(data, 'doctor/login');
      var body = json.decode(res.body);
      // var doctor = json.decode(body.doctor);
      print(body);
      print(body['success']);
      print(body['docter']);
      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        // print(localStorage.setString('token', body['token']));
        // print(body['token']);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => face1()));
        // CreateDialog(context, body['name']);
      } else {
        //_showMsg(body['message']);
        _showMsg('Enter Correct email and password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
      // child: Form(
      //   //key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: TextFormField(
              controller: ipController,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                //fillColor: Colors.black,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Enter your email',
                labelStyle:
                    TextStyle(color: Colors.black, fontFamily: "DMSans"),
                hoverColor: Colors.black,
              ),
              // onSaved: (value) => ip = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            child: TextFormField(
              controller: textController,
              obscureText: true,
              style: const TextStyle(color: Colors.black, fontFamily: "DMSans"),
              decoration: const InputDecoration(
                //fillColor: Colors.black,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Enter your password',
                //hintText: "psw",
                labelStyle:
                    TextStyle(color: Colors.black, fontFamily: "DMSans"),
                hoverColor: Colors.black,
              ),
              // onSaved: (value) => ip = value,
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 54, 119, 128),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Column(
              children: <Widget>[
                //  ),
                TextButton(
                    onPressed: () {
                      _login();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )),
          ),
        ],
        //   ),
      ),
    );
  }
}

// Column(
//         children: <Widget>[
//           SizedBox(
//             height: 40,
//           ),
//           // Container(
//           //   decoration: BoxDecoration(
//           //       color: Colors.black, borderRadius: BorderRadius.circular(10)),
//           //   child: InputField(),
//           // ),
//           // SizedBox(
//           //   height: 40,
//           // ),
//           // Text(
//           //   "Forgot Password?",
//           //   style: TextStyle(color: Colors.grey),
//           // ),
//           SizedBox(
//             height: 40,
//           ),
//           Button(),
//         ],),
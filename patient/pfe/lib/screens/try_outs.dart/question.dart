import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:pfe/screens/logged_in/logged_in.dart';
import 'package:pfe/main.dart';
import 'model_quest.dart';

void main() {
  runApp(Questionnaire());
}

class Questionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = GlobalKey<QuestionFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ConditionalQuestions(
          key: _key,
          children: questions(),
          trailing: [
            MaterialButton(
              color: Color.fromARGB(255, 24, 172, 149),
              textColor: Colors.white,
              splashColor: Colors.orangeAccent,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => LoggedIn())),
              ),
              // async {
              //   if (_key.currentState.validate()) {
              //     print("validated!");
              //   }
              // },
              child: Text(
                "Terminer",
                style: TextStyle(fontFamily: "DMSans"),
              ),
            )
          ],
          leading: [
            Text(
              "Evaluation de ",
              style: TextStyle(fontFamily: "DMSans", fontSize: 20),
            ),
            Text(
              "l'Etat General",
              style: TextStyle(fontFamily: "DMSans", fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}

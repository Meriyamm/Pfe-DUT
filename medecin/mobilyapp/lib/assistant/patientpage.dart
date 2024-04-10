import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobilyapp/Models/models.dart';
import 'package:mobilyapp/Models/user_patient.dart';
import 'package:mobilyapp/assistant/docpage.dart';

class patientpage extends StatelessWidget {
  const patientpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barr(),
      body: BodyBody(),
    );
  }
}

AppBar barr() {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 42, 102, 110),
    centerTitle: true,
    title: Text('Patients'),
    actions: <Widget>[
      FlatButton(
          onPressed: () {},
          child: Text("Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )))
    ],
  );
}

class listpat extends StatelessWidget {
  const listpat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Expanded(
            child: ListView.builder(
          itemCount: User.length,
          itemBuilder: (context, index) => lespatient(user: User[index]),
        )),
      ),
    );
  }
}

class lespatient extends StatelessWidget {
  final Userpatient user;

  const lespatient({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0 * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                    radius: 24, backgroundImage: AssetImage(user.imageUrl)),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        user.lasttime,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ]),
            )),
          ],
        ),
      ),
    );
  }
}

class BodyBody extends StatelessWidget {
  const BodyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        listpat(),
      ],
    ));
  }
}

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobilyapp/assistant/assistantpage.dart';
import 'package:mobilyapp/assistant/docpage.dart';
import 'package:mobilyapp/assistant/patientpage.dart';
import 'package:mobilyapp/help.dart';

class idafa extends StatelessWidget {
  idafa({Key? key}) : super(key: key);
  List pages = [
    patientpage(),
    doctorpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[1],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              backgroundColor: Color.fromARGB(255, 42, 102, 110),
              color: Colors.white,
              activeColor: Colors.white,
              gap: 20,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                    icon: Icons.people,
                    text: 'Patients',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Assistant(),
                        ),
                      );
                    }),
                GButton(
                    icon: CommunityMaterialIcons.doctor,
                    text: 'Doctor',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => doctorpage(),
                        ),
                      );
                    })
              ]),
        ));
  }

  AppBar Barr() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 42, 102, 110),
      centerTitle: true,
      title: Text('Doctors'),
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
}

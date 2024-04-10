import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobilyapp/assistant/Idafa.dart';
import 'package:mobilyapp/assistant/docpage.dart';
import 'package:mobilyapp/assistant/patientpage.dart';
import 'package:mobilyapp/help.dart';
import 'package:mobilyapp/welcom/Ahlan.dart';

import '../Models/user_patient.dart';

class Assistant extends StatelessWidget {
  Assistant({Key? key}) : super(key: key);
  List pages = [
    patientpage(),
    doctorpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[0],
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
                          builder: (context) => patientpage(),
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
                          builder: (context) => idafa(),
                        ),
                      );
                    }),
                GButton(
                    icon: Icons.logout,
                    text: 'Logout',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    }),
              ]),
        ));
  }

  AppBar Barr(BuildContext) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 42, 102, 110),
      centerTitle: true,
      title: Text('Patients'),
      actions: <Widget>[
        IconButton(
            onPressed: () => {},
            //  Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Login())),
            icon: Icon(Icons.logout)),
        // FlatButton(
        //     onPressed: () {},
        //     child: Text("Edit",
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 16,
        //         )))
      ],
    );
  }
}

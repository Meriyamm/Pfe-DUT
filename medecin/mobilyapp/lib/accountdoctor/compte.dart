import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilyapp/accountdoctor/profiledoc.dart';
import 'package:mobilyapp/help.dart';

class compte extends StatelessWidget {
  const compte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: center(),
    );
  }

  AppBar Bar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 42, 102, 110),
      centerTitle: true,
      title: Text('My Account'),
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

class center extends StatelessWidget {
  const center({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          comp(),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('My profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profile(),
                  ),
                );
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              )),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              )),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => helps(),
                  ),
                );
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              )),
        ],
      ),
    );
  }
}

class comp extends StatelessWidget {
  const comp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 158,
              color: Color.fromARGB(255, 42, 102, 110),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/doc.jpeg")))),
                Text(
                  "Doctor name",
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Cancer Doctor",
                    style: TextStyle(fontSize: 17, color: Colors.grey)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Doctorname@gmail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 184, 176, 176)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

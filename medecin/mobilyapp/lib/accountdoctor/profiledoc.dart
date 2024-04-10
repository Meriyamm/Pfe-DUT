import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilyapp/patients/interface_patient.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

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
      title: Text('My Profile'),
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
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'About',
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Dr.<Doctor name> is an oncologist doctor , in Hopital Mohammed 6 Marrakech,He treats cancer and provides medical care for a person diagnosed with cancer,and .................',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ]),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(fontSize: 18, color: Colors.black45),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 6,
                          ),
                          Icon(
                            Icons.my_location_outlined,
                            color: Color.fromARGB(255, 184, 176, 176),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                              'CHU Mohammed VI BP2360 Principal، Av. Ibn Sina, Marrakesh',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 80),
                          primary: Color.fromARGB(255, 111, 147, 153),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => patient(),
                            ),
                          );
                        },
                        child: Text(
                          '162 \n Patients',
                          style: TextStyle(fontSize: 25),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 80),
                          primary: Color.fromARGB(255, 111, 147, 153),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text(
                          '4+ \n Exp.Years',
                          style: TextStyle(fontSize: 25),
                        ))
                  ],
                )
              ],
            ),
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

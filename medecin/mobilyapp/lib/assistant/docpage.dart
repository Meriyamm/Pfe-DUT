import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobilyapp/Models/doctors_mod.dart';

class doctorpage extends StatefulWidget {
  const doctorpage({Key? key}) : super(key: key);

  @override
  State<doctorpage> createState() => _doctorpageState();
}

class _doctorpageState extends State<doctorpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barr(),
      body: bodydoc(),
    );
  }
}

AppBar barr() {
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

class listdoc extends StatelessWidget {
  const listdoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Expanded(
            child: ListView.builder(
          itemCount: doc.length,
          itemBuilder: (context, index) => lesdocteurs(doc: doc[index]),
        )),
      ),
    );
  }
}

class lesdocteurs extends StatelessWidget {
  final Doc doc;

  const lesdocteurs({
    Key? key,
    required this.doc,
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
                    radius: 24, backgroundImage: AssetImage(doc.imageUrl)),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        doc.time,
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

class bodydoc extends StatelessWidget {
  const bodydoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        listdoc(),
      ],
    ));
  }
}

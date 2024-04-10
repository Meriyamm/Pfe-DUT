import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilyapp/patients/under_patient.dart';

class patient extends StatelessWidget {
  const patient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 102, 110),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(
              color: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'All \nPatients',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              padding: EdgeInsets.only(left: 6),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    fillColor: CupertinoColors.secondarySystemFill,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Image.asset(
                            "assets/images/srch.png",
                            height: 25,
                          ),
                        ))),
              ),
            ),
            zonepatient()
          ],
        ),
      ),
    );
  }
}

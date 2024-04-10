import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class facealert extends StatelessWidget {
  final int id;
  final String tox;
  final String symp;
  final String img;
  final int grade;
  final String created_at;
  final String user;
  const facealert({
    Key? key,
    required this.id,
    required this.tox,
    required this.symp,
    required this.img,
    required this.grade,
    required this.created_at,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 700,
            child: Column(
              children: [
                Expanded(
                    child: CircleAvatar(
                  backgroundColor: grade == 1
                      ? Colors.green
                      : grade == 2
                          ? Color.fromARGB(255, 212, 198, 65)
                          : Colors.red,
                  radius: 40,
                  child: Icon(
                    Icons.flag,
                    size: 30,
                    color: Colors.white60,
                  ),
                )),
                Expanded(
                    child: Column(
                  children: [
                    DataTable2(columns: [
                      DataColumn(label: Text('Patient Name')),
                      DataColumn(label: Text(user)),
                    ], rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text('symptom')),
                        DataCell(Text(symp)),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('type of toxicity')),
                        DataCell(Text(tox)),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('Grade')),
                        DataCell(Text(grade.toString())),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('Time')),
                        DataCell(Text(created_at)),
                      ]),
                    ]),
                    // SizedBox(
                    //   height: 3,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Okay",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

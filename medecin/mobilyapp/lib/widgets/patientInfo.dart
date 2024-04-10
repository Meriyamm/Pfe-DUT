import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class PatientMore extends StatelessWidget {
  final String name;
  final String ip;
  final String age;
  final String sexe;
  const PatientMore(
      {Key? key,
      required this.name,
      required this.ip,
      required this.age,
      required this.sexe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'bilan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ))),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 42, 102, 110),
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              title: Text('Information about the patient'),
            ),
            body: Container(
                child: Stack(
              // clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  child: Column(children: [
                    Expanded(
                        child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 42, 102, 110),
                      radius: 40,
                      child: Icon(
                        Icons.person_pin,
                        size: 50,
                        color: Colors.white60,
                      ),
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        DataTable2(columns: [
                          DataColumn(label: Text('Patient Id')),
                          DataColumn(label: Text(ip)),
                        ], rows: <DataRow>[
                          // DataRow(cells: <DataCell>[
                          //   DataCell(Text('Patient ID')),
                          //   DataCell(Text('Before chemotherapy')),
                          // ]),
                          DataRow(cells: <DataCell>[
                            DataCell(Text('Patient Name')),
                            DataCell(Text(name)),
                          ]),
                          DataRow(cells: <DataCell>[
                            DataCell(Text('Age')),
                            DataCell(Text(age)),
                          ]),
                          DataRow(cells: <DataCell>[
                            DataCell(Text('Gender')),
                            DataCell(Text(sexe)),
                          ]),
                          // DataRow(cells: <DataCell>[
                          //   DataCell(Text('show symptoms')),
                          //   DataCell(Text('Before chemotherapy')),
                          // ]),
                          // DataRow(cells: <DataCell>[
                          //   DataCell(Text('pains')),
                          //   DataCell(Text('yes')),
                          // ]),
                          // DataRow(cells: <DataCell>[
                          //   DataCell(Text('type of toxicity')),
                          //   DataCell(Text('Example of the type')),
                          // ]),
                        ]),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ))
                  ]),
                )
              ],
            ))));
  }
}

// // import 'package:data_table_2/data_table_2.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:mobilyapp/welcom/Ahlan.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'bilan',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           elevatedButtonTheme: ElevatedButtonThemeData(
//               style: TextButton.styleFrom(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//           ))),
//       home: bilan(),
//     );
//   }
// }

// class bilan extends StatelessWidget {
//   final String name;
//   final String ip;
//   final String age;
//   final String sexe;
//   const bilan({Key? key, required this.name, required this.ip, required this.age, required this.sexe}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'bilan',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           elevatedButtonTheme: ElevatedButtonThemeData(
//               style: TextButton.styleFrom(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//           ))),
//       home: Scaffold(
//       appBar: haut(),
//       body: Container(
//         child: Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.center,
//       children: [
//         Container(
//           child: Column(children: [
//             Expanded(
//                 child: CircleAvatar(
//               backgroundColor: Color.fromARGB(255, 42, 102, 110),
//               radius: 40,
//               child: Icon(
//                 Icons.medical_services_outlined,
//                 size: 30,
//                 color: Colors.white60,
//               ),
//             )),
//             Expanded(
//                 child: Column(
//               children: [
//                 DataTable2(columns: [
//                   DataColumn(label: Text('Patient Id')),
//                   DataColumn(label: Text(ip)),
//                 ], rows: <DataRow>[
//                   // DataRow(cells: <DataCell>[
//                   //   DataCell(Text('Patient ID')),
//                   //   DataCell(Text('Before chemotherapy')),
//                   // ]),
//                   DataRow(cells: <DataCell>[
//                     DataCell(Text('Patient Name')),
//                     DataCell(Text(name)),
//                   ]),
//                   DataRow(cells: <DataCell>[
//                     DataCell(Text('Age')),
//                     DataCell(Text(age)),
//                   ]),
//                   DataRow(cells: <DataCell>[
//                     DataCell(Text('Gender')),
//                     DataCell(Text(sexe)),
//                   ]),
//                   // DataRow(cells: <DataCell>[
//                   //   DataCell(Text('show symptoms')),
//                   //   DataCell(Text('Before chemotherapy')),
//                   // ]),
//                   // DataRow(cells: <DataCell>[
//                   //   DataCell(Text('pains')),
//                   //   DataCell(Text('yes')),
//                   // ]),
//                   // DataRow(cells: <DataCell>[
//                   //   DataCell(Text('type of toxicity')),
//                   //   DataCell(Text('Example of the type')),
//                   // ]),
//                 ]),
//                 SizedBox(
//                   height: 3,
//                 ),
//               ],
//             ))
//           ]),
//         )
//       ],
//     )))
//     );
//   }
// }

// class request extends StatelessWidget {
//   const request({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.center,
//       children: [
//         Container(
//           child: Column(children: [
//             Expanded(
//                 child: CircleAvatar(
//               backgroundColor: Color.fromARGB(255, 42, 102, 110),
//               radius: 40,
//               child: Icon(
//                 Icons.medical_services_outlined,
//                 size: 30,
//                 color: Colors.white60,
//               ),
//             )),
//             Expanded(
//                 child: Column(
//               children: [
//                 DataTable2(columns: [
//                   DataColumn(label: Text('Patient Id')),
//                   DataColumn(label: Text('sanaa elghoul')),
//                 ], rows: <DataRow>[
//                   // DataRow(cells: <DataCell>[
//                   //   DataCell(Text('Patient ID')),
//                   //   DataCell(Text('Before chemotherapy')),
//                   // ]),
//                   DataRow(cells: <DataCell>[
//                     DataCell(Text('Patient Name')),
//                     DataCell(Text('Before chemotherapy')),
//                   ]),
//                   DataRow(cells: <DataCell>[
//                     DataCell(Text('Age')),
//                     DataCell(Text('Example of diagnostic')),
//                   ]),
//                   DataRow(cells: <DataCell>[
//                     DataCell(Text('Gender')),
//                     DataCell(Text('normal')),
//                   ]),
//                   // DataRow(cells: <DataCell>[
//                   //   DataCell(Text('show symptoms')),
//                   //   DataCell(Text('Before chemotherapy')),
//                   // ]),
//                   // DataRow(cells: <DataCell>[
//                   //   DataCell(Text('pains')),
//                   //   DataCell(Text('yes')),
//                   // ]),
//                   // DataRow(cells: <DataCell>[
//                   //   DataCell(Text('type of toxicity')),
//                   //   DataCell(Text('Example of the type')),
//                   // ]),
//                 ]),
//                 SizedBox(
//                   height: 3,
//                 ),
//               ],
//             ))
//           ]),
//         )
//       ],
//     ));
//   }
// }

// AppBar haut() {
//   return AppBar(
//     backgroundColor: Color.fromARGB(255, 42, 102, 110),
//     centerTitle: true,
//     title: Text('Information of the patient'),
    
//   );
// }

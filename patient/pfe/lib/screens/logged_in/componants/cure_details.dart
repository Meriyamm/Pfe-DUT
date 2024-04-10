import 'package:flutter/material.dart';

class CureDetails extends StatelessWidget {
  final String date;
  final String analyses;
  const CureDetails({
    Key key,
    @required this.analyses,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247)),
        home: Scaffold(
            body: Stack(children: <Widget>[
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          'assets/icons/x.png',
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Text(
                                  "تفاصيل العلاج",
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 25,
                                      color: Color(0xFF0f3c78),
                                      fontWeight: FontWeight.bold),
                                ),
                                Image.asset(
                                  'assets/icons/vaccine.png',
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: date == null
                            ? const CircularProgressIndicator(
                                color: const Color(0xFF26d3ba),
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          date,
                                          style: const TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16,
                                              color: Colors.grey),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          '  الوقت -    ',
                                          style: const TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 17,
                                          ),
                                        ),
                                        const Icon(Icons.date_range)
                                      ],
                                    ),
                                  ),
                                  const Divider(color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Text(
                                          analyses == null ? '-' : analyses,
                                          style: const TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16,
                                              color: Colors.grey),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          'التحاليل -  ',
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 17),
                                        ),
                                        const Icon(Icons.medical_services_outlined)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      )),
                    ],
                  ))
                ]),
          ))
        ])));
  }
}

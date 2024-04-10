import 'package:flutter/material.dart';
import 'package:pfe/screens/anonyme/componants/bar.dart';

import '../../../constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: <Color>[Color(0xFF0f3c78), Color(0xFF26d3ba)]),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.23),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
/*
Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          // The search area here
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: <Color>[Color(0xFF0f3c78), Color(0xFF26d3ba)]),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.23),
                  spreadRadius: 5,
                  blurRadius: 50,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
    );

*/

/*MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      )),
    );*/
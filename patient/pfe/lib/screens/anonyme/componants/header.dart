import 'package:flutter/material.dart';
import 'package:pfe/constants.dart';
import 'package:pfe/screens/anonyme/componants/bar.dart';
import 'package:pfe/screens/anonyme/componants/search.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    //required this.size,
  }) : super(key: key);

  get kPrimaryColor => null;
  //final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/icons/menu2.png'),
                color: Colors.white,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen())),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen())),
                      icon: const Icon(
                        Icons.search,
                        size: 27,
                      ),
                      color: const Color(0xff26d3ba)),
                ),
              ),
              //const Spacer(),

              /*Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                        hintText: 'Search',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            /* Clear the search field */
                          },
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),*/
            ],
          ),
        )
      ],
    );
  }
}

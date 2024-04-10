import 'package:flutter/material.dart';
import 'package:pfe/main.dart';
import 'package:pfe/screens/logged_in/advices.dart';
import 'package:pfe/screens/logged_in/componants/test_Cut.dart';
import 'package:pfe/screens/logged_in/posts.dart';
import 'package:pfe/screens/logged_in/previous_home.dart';
import 'package:pfe/screens/logged_in/home_screen.dart';
import 'package:pfe/screens/logged_in/messages.dart';
import 'package:pfe/screens/logged_in/notifications.dart';
import 'package:pfe/screens/logged_in/test.dart';

import '../anonyme/componants/nav_bar.dart';

class LoggedIn extends StatelessWidget {
  LoggedIn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({
    Key key,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScr(),
    Advices(),
    Test(),
    const AllPosts(),
    //ChatScreen(),
    //Try3(),
    const NotifScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromARGB(255, 146, 146, 146),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'إستقبال',
            //backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.medical_services,
            ),
            label: 'نصائح',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size: 55,
              color: Color.fromARGB(255, 87, 194, 178),
            ),

            label: '====',
            //backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.device_hub),
            label: 'أسئلة',
            //backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'إشعارات',
            //backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 115, 219, 204),
        onTap: _onItemTapped,
      );
  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 2) {
      return Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: _selectedIndex == 0
            ? AppBar(
                flexibleSpace: _selectedIndex == 0
                    ? Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                          Color(0xFF0f3c78),
                          Color(0xFF26d3ba),
                        ])),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(71, 116, 180, 214),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/icons/menu2.png'),
                      color: Colors.white,
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },

                      // =>
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ProfileScreen())),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                ),
              )
            : AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 247, 247, 247),
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(131, 177, 241, 232),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/icons/menu3.png'),
                      color: Colors.white,
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                ),
              ),
      ),
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}

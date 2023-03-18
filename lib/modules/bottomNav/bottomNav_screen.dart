import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/chat/chat_screen.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/notification/notification_screen.dart';
import 'package:project/modules/profile/profile_screen.dart';
import 'package:project/modules/settings/settings_screen.dart';


class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  int currentIndex = 2;

  List<Widget> pages = <Widget>
  [
    SettingsScreen(),
    Chat(),
    HomeScreen(),
    NotifyScreen(),
    ProfileScreen(),
  ];

  void changeItem(int index) {
    print(index);
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        items:
        [
          Container(
              width: 30.0,
              height: 30.0,
              child: Image.asset('assets/images/bottomNavBar/settings.png')),
          Container(
              width: 30.0,
              height: 30.0,
              child: Image.asset('assets/images/bottomNavBar/messages.png')),
          Container(
              width: 50.0,
              height: 50.0,
              child: Image.asset('assets/images/bottomNavBar/home.png')),
          Container(
              width: 30.0,
              height: 30.0,
              child: Image.asset('assets/images/bottomNavBar/ring.png',)),
          Container(
              width: 30.0,
              height: 30.0,
              child: Image.asset('assets/images/bottomNavBar/profile.png',)),
        ],
        height: 60,
        index: currentIndex,
        color: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        onTap: changeItem ,
      ),
    );
  }


}
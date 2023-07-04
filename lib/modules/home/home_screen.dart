import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/alarm_screen/alarm_screen.dart';
import 'package:project/modules/main_page/main_page.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;

  List<Widget> pages = <Widget>
  [
    const AlarmScreen(),
    const MainPage(),
    const ProfileScreen(),
  ];

  void changeItem(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items:
        [
          // SizedBox(
          //     width: 30.0,
          //     height: 30.0,
          //     child: Image.asset('assets/images/bottomNavBar/ring.png',)),
          // SizedBox(
          //     width: 50.0,
          //     height: 50.0,
          //     child: Image.asset('assets/images/bottomNavBar/home.png'),
          // ),
          // SizedBox(
          //     width: 30.0,
          //     height: 30.0,
          //     child: Image.asset('assets/images/bottomNavBar/profile.png',),
          // ),
          Icon(
              Icons.alarm,
            size: 35.0,
          ),
          Icon(
              Icons.home,
            size: 35.0,
          ),
          Icon(
            Icons.person_outline_outlined,
            size: 35.0,
          )
        ],
        height: 60.0,
        index: currentIndex,
        color: Colors.white,
        backgroundColor: CustomColor.blue11,
        animationCurve: Curves.easeInOut,
        onTap: changeItem ,
      ),
    );
  }
}

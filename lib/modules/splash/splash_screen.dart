import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/modules/onboarding_screen/on_boarding_screen.dart';
import '../../components/custom_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  NavigationFunction(context) async {
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return OnBoardingScreen();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    NavigationFunction(context);
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ Colors.white,CustomColor.blue11.withOpacity(.9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [ 0.0,1.0],
              tileMode: TileMode.clamp
          ),
        ),
        child: Column(
          children:
          [
            SizedBox(
              height: 230,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: ' D',
                    style: TextStyle(
                        color: CustomColor.sky,
                        fontWeight: FontWeight.bold,
                        fontSize: 90.0,
                    )
                  ),
                  TextSpan(
                    text: '21',
                    style: TextStyle(
                      color: CustomColor.mastard,
                        fontWeight: FontWeight.bold,
                      fontSize: 80.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/modules/splash/splash_screen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const SplashScreen(),
      builder:(context , child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: .84),
          child: child!,
        );
      },
    );
  }
}



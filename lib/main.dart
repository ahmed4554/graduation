import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/modules/login_screen/cubit/cubit.dart';
import 'package:project/modules/register_screen/cubit/cubit.dart';
import 'package:project/modules/splash/splash_screen.dart';

void main() {
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(create: (BuildContext context) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}



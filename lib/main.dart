import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/cache_helper.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/modules/child_app/chat_bot/bot_cubit.dart';
import 'package:project/modules/guest_screen/donor_cubit.dart';
import 'package:project/modules/login_screen/cubit/cubit.dart';
import 'package:project/modules/register_screen/cubit/cubit.dart';
import 'package:project/modules/splash/splash_screen.dart';
import 'package:project/utils/bloc_observer/bloc_observer.dart';
import 'package:project/utils/cubits/data_cubit/data_cubit.dart';
import 'package:project/utils/cubits/data_cubit/data_states.dart';
import 'package:project/utils/follow_child_cubit/follow_child_cubit.dart';
import 'package:project/utils/reminder_cubit/reminder_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();

  CacheHelper.getData(key: 'onBoarding');

  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
  await Alarm.init();
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              DataCubit()..listenOnUserLogInState()..finishOnBoarding(),
        ),
        BlocProvider(create: (BuildContext context) => DonorCubit()),
        BlocProvider(create: (BuildContext context) => BotCubit()),
        BlocProvider(create: (BuildContext context) => ReminderCubit()),
        BlocProvider(create: (BuildContext context) => FollowChildCubit()),
      ],
      child: BlocConsumer<DataCubit, DataStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
          ),
          home: const SplashScreen(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: .84),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}

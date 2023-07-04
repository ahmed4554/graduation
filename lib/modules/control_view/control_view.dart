import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/access_screen/access_screen.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/onboarding_screen/on_boarding_screen.dart';
import 'package:project/utils/cubits/data_cubit/data_cubit.dart';
import 'package:project/utils/cubits/data_cubit/data_states.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataStates>(builder: (context, state) {
      if (DataCubit.get(context).IsLogged == true) {
        return const AccessScreen();
      } else if (DataCubit.get(context).onBoarding == true) {
        return const AccessScreen();
      } else {
        return OnBoardingScreen();
      }
    });
  }
}

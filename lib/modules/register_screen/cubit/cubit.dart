import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/components/end_points.dart';
import 'package:project/modules/register_screen/cubit/states.dart';

import '../../../network/dio_helper/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterCubitState>
{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) {
    return BlocProvider.of(context);
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  void userRegister({
    required String email,
    required String password,
    //required String phoneNumber,
    required String userName,
  })
  {
    emit(RegisterInitialState());

    DioHelper.postData(
      url: register,
      data:
        {
          'email': email,
          'password': password,
          'user_name': userName,
        },
    ).then((value) {
      log(value.data.toString());
      emit(RegisterSuccessState());
    }).catchError((error){
      log(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }


  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibility());
  }
}
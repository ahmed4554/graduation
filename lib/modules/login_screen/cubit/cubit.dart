import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/components/end_points.dart';
import 'package:project/modules/login_screen/cubit/states.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool check = false;

  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  Response? loginData;

  var nameGuestController = TextEditingController();
  var phoneGuestController = TextEditingController();
  var locationGuestController = TextEditingController();
  var bloodTypeController = TextEditingController();
  Response? guestData;

  void userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());

    // DioHelper.postData(
    //     url: login,
    //     data:
    //     {
    //       'email': email,
    //       'password': password,
    //     },
    // ).then((value){
    //   log(value.data.toString());
    //   emit(LoginSuccessState());
    // }).catchError((error){
    //   log(error.toString());
    //   emit(LoginErrorState(error.toString()));
    // });
    try {
      loginData = await DioHelper.postData(url: login, data: {
        'email': email,
        'password': password,
      });
      emit(LoginSuccessState());
    } on Exception catch (e) {
      print(e);
      emit(LoginErrorState(e.toString()));
      rethrow;
    }
  }

  void checkLog(bool value) {
    check = value;
    emit(CheckState());
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibility());
  }


  void guestLogin({
    required String name,
    required String phone,
    required String location,
    required String bloodType,
  }) async {
    emit(GuestLoadingState());

    try {
      guestData = await DioHelper.postData(
        url: donor,
        data: {
          'name': name,
          'phone': phone,
          'location':location,
          'bloodType':bloodType
        },
      );
      emit(GuestSuccessState());
    }on Exception catch (e)
    {
      emit(GuestSuccessState());
      rethrow;
    }
  }
}

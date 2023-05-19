import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/components/end_points.dart';
import 'package:project/modules/login_screen/cubit/states.dart';

class LoginCubit extends Cubit<LoginCubitState>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool check = false;

  void userLogin({
    required String email,
    required String password
})

  {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: login,
        data:
        {
          'email': email,
          'password': password,
        },
    ).then((value){
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error){
      print(error);
      emit(LoginErrorState(error.toString()));
    });
  }

  void checkLog(bool value){
    check = value;
    emit(CheckState());
  }

}
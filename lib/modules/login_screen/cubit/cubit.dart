import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/cache_helper.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/components/end_points.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/login_screen/cubit/states.dart';
import 'package:project/modules/register_screen/cubit/cubit.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool check = false;

  // Controllers for profile and reset
  var phoneController = TextEditingController();
  var userNameController = TextEditingController();

  // Controllers for login
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Response? loginData;

  int? id;

  void userLogin({
    required String email,
    required String password,
    required context,
  }) async {
    emit(LoginLoadingState());

    try {
      loginData = await DioHelper.postData(
          url: login,
          data:  {
                  'email': email,
                  'password': password,
                 }
                ).then((value)async
                 {
                  id = value.data['user_id'];
                  print(id);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
                  print(userNameController.text);

                  emit(LoginSuccessState());
                  emailController.clear();
                  passwordController.clear();
                 }
               );

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
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project/models/user_model/user_model.dart';

import 'package:project/modules/login_screen/cubit/states.dart';

import 'package:firebase_auth/firebase_auth.dart';

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

  UserModel? userModel;

  FirebaseAuth auth = FirebaseAuth.instance;

  void userLogin(context) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      emit(LoginSuccessState());
    } on FirebaseException catch (e) {
      emit(LoginErrorState(e.toString()));

      rethrow;
    } catch (e) {
      emit(LoginErrorState(e.toString()));

      rethrow;
    }
  }

  // Response? loginData;
  // void userLogin({
  //   required String email,
  //   required String password,
  //   required context,
  // }) async {
  //   emit(LoginLoadingState());

  //   try {
  //     loginData = await DioHelper.postData(
  //         url: login,
  //         data:  {
  //                 'email': email,
  //                 'password': password,
  //                }
  //               ).then((value)async
  //                {
  //                 print(id);
  //                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
  //                 print(userNameController.text);
  //                 await CacheHelper.saveData(key: 'isLogged', value: true);
  //                 userModel = UserModel(
  //                   email: emailController.text,
  //                   id: value.data['user_id'],
  //                   pass: passwordController.text,
  //                 );
  //                 await DatabaseHelper.db.insertToDb(userModel!).then((value) {
  //                   print('added');
  //                 }).catchError((e) {
  //                   print(e);
  //                 });

  //                 emit(LoginSuccessState());
  //                 emailController.clear();
  //                 passwordController.clear();
  //                }
  //              );

  //   } on Exception catch (e) {
  //     print(e);
  //     emit(LoginErrorState(e.toString()));
  //     rethrow;
  //   }
  // }

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

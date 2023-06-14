import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/components/end_points.dart';
import 'package:project/modules/login_screen/cubit/cubit.dart';
import 'package:project/modules/register_screen/cubit/states.dart';
import '../../../components/cache_helper.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
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
  File? image;

  Response? uploadPhoto;

  void userRegister({
    required String email,
    required String password,
    required String phoneNumber,
    required String userName,
    context,
  }) {
    emit(RegisterInitialState());

    DioHelper.postData(
      url: register,
      data: {
        'email': email,
        'password': password,
        'user_name': userName,
        "phone_number": phoneNumber,
      },
    ).then((value)async {
      log(value.data.toString());
      await CacheHelper.saveData(key: 'userName', value: userNameController.text);
      await CacheHelper.saveData(key: 'email', value: emailController.text);
      await CacheHelper.saveData(key: 'password', value: passwordController.text);
      await CacheHelper.saveData(key: 'phone_number', value: phoneController.text);

      emit(RegisterSuccessState());
      emailController.clear();
      userNameController.clear();
      phoneController.clear();
      passwordController.clear();

    }).catchError((error) {
      log(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibility());
  }

  void _upload(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = Dio();

    dio
        .post("http://192.168.43.225/api/media", data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  Future getImage(context) async {
    final picker = ImagePicker();

    dynamic _pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);

    image = File(_pickedFile.path);

    uploadProfilePhoto(context: context);
  }

  void uploadProfilePhoto({
    required context
}) async {
    emit(UploadPhotoLoadingState());

    FormData photoData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
      )
    });
    try{
      uploadPhoto = await DioHelper.postImage(
          url: 'upload-photo/${LoginCubit.get(context).id}',
          data: photoData
      );
      emit(UploadPhotoSuccessState());
    }catch(e){
      emit(UploadPhotoErrorState(e.toString()));
      rethrow;
    }
  }
}

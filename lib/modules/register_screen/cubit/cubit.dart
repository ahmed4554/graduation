import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:project/models/user_model/user_model.dart';
import 'package:project/modules/access_screen/access_screen.dart';
import 'package:project/modules/register_screen/cubit/states.dart';
import 'package:project/utils/cubits/data_cubit/data_cubit.dart';

import '../../../constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../home/home_screen.dart';

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
  File? userImage;
  String? userImageUrl;

  final storage = FirebaseStorage.instance;

  Response? uploadPhoto;
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference database = FirebaseFirestore.instance.collection('users');

  void userRegister(context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        model = UserModel(
          email: emailController.text,
          phoneNumber: phoneController.text,
          userName: userNameController.text,
          id: value.user!.uid,
          image: userImageUrl,
        );
        await database.doc(value.user!.uid).set(model!.toJson());
      });

      emit(RegisterSuccessState());
    } on FirebaseException catch (e) {
      emit(RegisterErrorState(e.toString()));

      rethrow;
    } catch (e) {
      emit(RegisterErrorState(e.toString()));

      rethrow;
    }
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibility());
  }

  Future<void> getImage(context) async {
    final picker = ImagePicker();

    dynamic _pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50, // <- Reduce Image quality
      maxHeight: 500, // <- reduce the image size
      maxWidth: 500,
    );

    userImage = File(_pickedFile.path);
    uploudUserImagePhoto(context);
  }

  void uploudUserImagePhoto(context) async {
    emit(UploadUserPhotoLoadingState());
    await storage
        .ref('Profile_images/${userImage!.path.split('/').last}')
        .putFile(userImage!)
        .then((value) async {
      userImageUrl = await value.ref.getDownloadURL();
      emit(UploadUserPhotoSuccessState());
    }).catchError((e) {
      log(e.toString());
      emit(UploadUserPhotoErrorState(e.toString()));
    });
  }

  void logOut(context) async {
    emit(LogOutLoading());
    try {
      await auth.signOut();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AccessScreen()),
          (route) => false);
      model = null;
      emit(LogOutSucces());
    } on FirebaseAuthException catch (e) {
      emit(LogOutError(e.toString()));
      rethrow;
    } on FirebaseException catch (e) {
      emit(LogOutError(e.toString()));
      rethrow;
    } catch (e) {
      emit(LogOutError(e.toString()));
      rethrow;
    }
  }

  // void uploadProfilePhoto({required context}) async {
  //   emit(UploadPhotoLoadingState());

  //   FormData photoData = FormData.fromMap({
  //     'file': await MultipartFile.fromFile(
  //       image!.path,
  //       filename: image!.path.split('/').last,
  //     )
  //   });
  //   try {
  //     uploadPhoto = await DioHelper.postImage(
  //         url: 'upload-photo/${model!.id}', data: photoData);

  //     getUserPhoto(context);

  //     emit(UploadPhotoSuccessState());
  //   } catch (e) {
  //     emit(UploadPhotoErrorState(e.toString()));
  //     rethrow;
  //   }
  // }

  // Response? userImageResponse;

  // var userImage;

  // void getUserImage() async {
  //   final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  //   printWarning(model!.email!);
  //   printWarning(model!.image!.toString());

  //   if (model != null) {
  //     emit(PrepareImageAsBytesAndGetLoading());

  //     Directory imageDirectory =
  //         await Directory('${appDocumentsDir.path}/images/')
  //             .create(recursive: true);

  //     userImage = await File('${imageDirectory.path}/${model!.email}.jpg')
  //         .writeAsBytes(model!.image!);
  //     printWarning('this is user image $userImage');
  //     emit(PrepareImageAsBytesAndGetSuccess());
  //   }
  //     emit(PrepareImageAsBytesAndGetSuccess());
  // }

  // void getUserPhoto(context) async {
  //   emit(GetUserImageLoading());
  //   try {
  //     // get the profile photo from the api
  //     userImageResponse =
  //         await DioHelper.getData(url: 'uploaded-photos/${model!.id}');
  //     print(userImageResponse!.data);
  //     // preparing the image to insert in the database
  //     var base64Image = image!.readAsBytesSync();
  //     model!.image = base64Image;
  //     emit(AddImageBytesInTheModel());

  //     try {
  //       // insert into the databse
  //       emit(UpdateUserDataInTheDataBaseLoading());
  //       await DatabaseHelper.db.updateDb(model!);
  //       getUserData(context);
  //       getUserImage();
  //       emit(UpdateUserDataInTheDataBaseSuccess());
  //       emit(GetUserImageSuccess());

  //     } catch (e) {
  //       emit(UpdateUserDataInTheDataBaseError());
  //       rethrow;
  //     }
  //     emit(GetUserImageSuccess());
  //   } catch (e) {
  //     emit(GetUserImageFailded(error: e.toString()));
  //     rethrow;
  //   }
  // }

  // void logOut(context) async {
  //   await CacheHelper.removeData(key: 'isLogged');
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => const AccessScreen()),
  //       (route) => false);
  //   emit(UserLoggedOut());
  // }
}

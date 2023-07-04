import 'dart:developer';
import 'dart:io';
import 'package:alarm/alarm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/components/cache_helper.dart';
import 'package:project/constants/constants.dart';
import 'package:project/models/message_model/messages_model.dart';
import 'package:project/models/object_detection/object_detection.dart';
import 'package:project/models/user_model/user_model.dart';
import '../../../network/dio_helper/dio_helper.dart';
import 'data_states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataCubit extends Cubit<DataStates> {
  DataCubit() : super(InitialDataState());

  static DataCubit get(context) => BlocProvider.of(context);

  File? image;

  TextEditingController controller = TextEditingController();

  String dateString = 'Pick Date';
  String timeString = 'Pick Time';

  DateTime? date;

  TimeOfDay? time;

  DateTime? alarmDate;

  String? userName;

  FirebaseAuth auth = FirebaseAuth.instance;

  bool IsLogged = false;
  bool onBoarding = false;

  void finishOnBoarding() async {
    onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
    emit(OnBoardingScreenFinish());
  }

  void listenOnUserLogInState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        IsLogged = false;
        emit(UserLoggedOut());
      } else {
        IsLogged = true;
        emit(UserLoggedIn());
        getUserDataOnOpen(user);
      }
    });
  }

  void getUserDataOnOpen(User user) async {
    emit(GetUserDataOnOpenLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      model = UserModel.fromJson(value.data()!);
      userName = model!.id!;
      log(model!.id!);
      emit(GetUserDataOnOpenSUcces());
    }).catchError((e) {
      log(e.toString());
      emit(GetUserDataOnOpenError(error: e.toString()));
    });
  }

  void setAlarm() async {
    if (alarmDate != null) {
      final alarmSettings = AlarmSettings(
        id: 0,
        dateTime: alarmDate!,
        assetAudioPath: 'assets/alarm/music.mp3',
        loopAudio: true,
        vibrate: true,
        fadeDuration: 3.0,
        notificationTitle: 'Remember',
        notificationBody: controller.text,
        enableNotificationOnKill: true,
      );
      try {
        await Alarm.setNotificationOnAppKillContent(
            'Remember', controller.text);
        await Alarm.set(alarmSettings: alarmSettings);
        emit(AlarmSetSuccess());
      } catch (e) {
        emit(AlarmSetFailded(error: e.toString()));
      }
    } else {
      emit(AlarmSettingIsNull());
    }
  }

  final imagePicker = ImagePicker();

  ObjectDetection? objectDetection;

  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxWidth: 400,
      maxHeight: 500,
    );

    if (pickedImage != null) {
      emit(ImageCapturedSuccess());
      log(pickedImage.path);
      image = File(pickedImage.path);
      log(image!.path);
      FormData data = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
        )
      });
      try {
        emit(ObjectDetectionLoading());
        Response response = await DioDetectionHelper.uploadImageToDetect(data);
        objectDetection = ObjectDetection.fromJson(response.data);
        emit(ObjectDetectionSuccess());
        // log(response.data.toString());
      } catch (e) {
        emit(ObjectDetectionFailed(error: e.toString()));
        rethrow;
      }
    } else {
      emit(ImageCapturedFailed());
    }
  }

  uploadGImage() async {
    var pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 800,
      imageQuality: 50
    );

    if (pickedImage != null) {
      emit(ImageCapturedSuccess());
      image = File(pickedImage.path);
      FormData data = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
        ),
      });

      log(data.files[0].key.toString());
      try {
        emit(ObjectDetectionLoading());
        Response response = await DioDetectionHelper.uploadImageToDetect(data);
        objectDetection = ObjectDetection.fromJson(response.data);
        emit(ObjectDetectionSuccess());
        log((objectDetection!
                .results![0].entities![0].objects![0].entities![0].classes)
            .toString());
        log((objectDetection!.results![0].entities![0].objects![0].box![2])
            .toString());
        // log(response.data.toString());
      } catch (e) {
        emit(
          ObjectDetectionFailed(
            error: e.toString(),
          ),
        );
        rethrow;
      }
    } else {
      emit(ImageCapturedFailed());
    }
  }

  List<MessagesModel> messages = [];

  TextEditingController chatController = TextEditingController();

  CollectionReference chatGroup =
      FirebaseFirestore.instance.collection('chatGroup');

//prepare sending photo in chats

// the progress is going like this [ takePhoto() = > uploudPhoto() = > getAllImages() ]
  File? imageToSendInChat;
  XFile? _image;

  final storage = FirebaseStorage.instance;

  String? currentImageToUploadURL;

  Map<String, String> allPictures = {};

  void takePhoto({
    required String currentGroup,
  }) async {
    emit(TakePhotoToSendInChatLoading());
    try {
      final ImagePicker picker = ImagePicker();
      _image = await picker.pickImage(source: ImageSource.gallery);
      imageToSendInChat = File(_image!.path);
      emit(TakePhotoToSendInChatSuccess());
    } catch (e) {
      emit(TakePhotoToSendInChatFailded(error: e.toString()));
      log(e.toString());
    }
  }

  Future<void> uploudPhoto(
      {required String currentGroup, required String imageId}) async {
    if (imageToSendInChat != null) {
      emit(UploudImageLoading());
      try {
        await storage
            .ref()
            .child('ChatGroupImages/$currentGroup/$userName/$imageId')
            .putFile(imageToSendInChat!)
            .then((value) async {
          emit(UploudImageSuccess());
          currentImageToUploadURL = await value.ref.getDownloadURL();
          getAllPictures(currentGroup: currentGroup);
          // log(currentImageToUploadURL);
        });
      } on FirebaseException catch (e) {
        emit(UploudImageFailded(error: e.toString()));
        rethrow;
      } catch (e) {
        emit(UploudImageFailded(error: e.toString()));
        log(e.toString());
      }
    } else {
      emit(TakePhotoToSendInChatFailded(error: 'The photo is Empty'));
    }
  }

  // get all pictures

  void getAllPictures({required String currentGroup}) async {
    emit(GetAllImageLoading());
    try {
      await storage
          .ref()
          .child('ChatGroupImages/$currentGroup/$userName')
          .listAll()
          .then((value) async {
        for (var i in value.items) {
          if (allPictures.containsKey(i.name) == false) {
            allPictures.addAll({i.name: await i.getDownloadURL()});
          }
        }
        emit(GetAllImageSuccess());
      });
    } catch (e) {
      emit(GetAllImageFailded(error: e.toString()));
    }
  }

//send message to group
  void sendMessage({
    required String kind,
    required String currentGroup,
  }) async {
    printWarning(model!.id!);
    MessagesModel? message;
    if (imageToSendInChat != null) {
      await uploudPhoto(
          currentGroup: currentGroup,
          imageId: imageToSendInChat!.path.split('/').last);
    }
    if (currentImageToUploadURL != null) {
      message = MessagesModel(
        date: Timestamp.now(),
        kind: 'pic',
        pic: currentImageToUploadURL,
        text: imageToSendInChat!.path.split('/').last,
        userName: userName,
        senderImage: model!.image,
      );
    } else {
      message = MessagesModel(
        date: Timestamp.now(),
        kind: 'text',
        pic: '',
        text: controller.text,
        userName: userName,
        senderImage: model!.image,
      );
    }
    emit(SendMessageLoading());
    try {
      await chatGroup
          .doc(currentGroup)
          .collection('messages')
          .doc()
          .set(message.toMap())
          .then((value) {});
      controller.clear();
      message = null;
      imageToSendInChat = null;
      _image = null;
      currentImageToUploadURL = null;
      emit(SendMessageSuccess());
    } on FirebaseException catch (e) {
      emit(SendMessageFailed(error: e.toString()));
    } catch (e) {
      rethrow;
    }
  }
}

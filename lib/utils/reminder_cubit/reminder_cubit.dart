import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/utils/cubits/data_cubit/data_cubit.dart';
import 'package:project/utils/reminder_cubit/reminder_states.dart';

import '../../constants/constants.dart';
import '../../models/prescription_model/prescription_model.dart';

class ReminderCubit extends Cubit<ReminderStates> {
  ReminderCubit() : super(ReminderInitialState());

  static ReminderCubit get(context) => BlocProvider.of(context);

  final storage = FirebaseStorage.instance;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  List<PrescriptionModel> allPrescriptions = [];

  File? prescriptionImage;

  String? prescriptionImageUrl;
  Future<void> takePhoto() async {
    emit(TakePhotoToSendInChatLoading());
    try {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      prescriptionImage = File(image!.path);
      emit(TakePhotoToSendInChatSuccess());
    } catch (e) {
      emit(TakePhotoToSendInChatFailded());
      log(e.toString());
    }
  }

  void uploudPrescriptionPhoto(context) async {
    emit(UploadPrescriptionLoading());
    await storage
        .ref(
            'prescription_images/${model!.id}/${prescriptionImage!.path.split('/').last}')
        .putFile(prescriptionImage!)
        .then((value) async {
      prescriptionImageUrl = await value.ref.getDownloadURL();
      emit(UploadPrescriptionSuccess());
    }).catchError((e) {
      log(e.toString());
      emit(UploadPrescriptionFailded());
    });
  }

  void setPrescriptionData(context) async {
    emit(SetPrescriptionDataLoading());
    PrescriptionModel innerModel = PrescriptionModel(
      date: (DateTime.now().toString()),
      desc: descController.text,
      title: titleController.text,
      image: prescriptionImageUrl,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(model!.id)
        .collection('prescriptions')
        .doc()
        .set(innerModel.toJson())
        .then((value) {
      // getAllPrescriptions(context);
      emit(SetPrescriptionDataSuccess());
      titleController.clear();
      descController.clear();
      prescriptionImage = null;
    }).catchError((e) {
      log(e.toString());
      emit(SetPrescriptionDataFailded());
    });
  }

  // void getAllPrescriptions(context) async {
  //   emit(GetAllPrescriptionsLoading());
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(model!.id)
  //       .collection('prescriptions')
  //       .orderBy(
  //         'date',
  //         descending: false,
  //       )
  //       .get()
  //       .then((value) {
  //     if (allPrescriptions.isNotEmpty) {
  //       for (var i = 0; i < value.docs.length; i++) {
  //         if (allPrescriptions[i].image != value.docs[i]['image']) {
  //           allPrescriptions
  //               .add(PrescriptionModel.fromJson(value.docs[i].data()));
  //         }
  //       }
  //     } else {
  //       for (var i in value.docs) {
  //         allPrescriptions.add(PrescriptionModel.fromJson(i.data()));
  //       }
  //     }

  //     emit(GetAllPrescriptionsSuccess());
  //   }).catchError((e) {
  //     log(e.toString());
  //     emit(GetAllPrescriptionsFailded());
  //   });
  // }
}

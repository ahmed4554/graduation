import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/constants/constants.dart';
import 'package:project/models/blood_donor_info/blood_donor_info.dart';
import 'package:project/modules/guest_screen/donor_cubit_states.dart';

class DonorCubit extends Cubit<DonorCubitStates> {
  DonorCubit() : super(DonorInitialState());

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  var bloodTypeController = TextEditingController();

  String? lat;
  String? long;

  static DonorCubit get(context) {
    return BlocProvider.of(context);
  }

  CollectionReference bloodDonorsInfo =
      FirebaseFirestore.instance.collection('bloodDonorsInfo');

  BloodDonorInfo? model;

  List<BloodDonorInfo> donors = [];

  void addDonor() async {
    model = BloodDonorInfo(
        bloodType: bloodTypeController.text,
        donorName: nameController.text,
        lat: lat,
        long: long,
        phoneNumber: phoneNumberController.text);
    try {
      await bloodDonorsInfo.doc().set(model!.toJson());
      nameController.clear();
      phoneNumberController.clear();
      bloodTypeController.clear();

      emit(DonorSuccessState());
    } on FirebaseException catch (e) {
      printWarning(e.toString());
      emit(DonorErrorState(e.toString()));
    } catch (e) {
      printWarning(e.toString());
      emit(DonorErrorState(e.toString()));
    }
  }

  void searchDonor(int currentIndex) async {
    donors = [];
    String bloodType = bloodKinds[currentIndex];
    emit(SearchDonorLoadingState());

    await bloodDonorsInfo
        .where('blood_type', isEqualTo: bloodType)
        .get()
        .then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        donors.add(BloodDonorInfo.fromJson(value.docs[i]));
        printWarning(donors[i].phoneNumber.toString());
      }
      emit(SearchDonorSuccessState());
    }).catchError((e) {
      printWarning(e.toString());
      emit(SearchDonorErrorState(e.toString()));
      throw (e);
    });
  }

  // void addDonor({
  //   required String name,
  //   required String phoneNumber,
  //   required String long,
  //   required String lat,
  //   required String bloodType,

  // }) async {
  //   emit(DonorLoadingState());
  //   await DioHelper.postData(
  //     url: donor,
  //     data: {
  //       "donor_name": name,
  //       "long": long,
  //       "lat": lat,
  //       "phone_number": phoneNumber,
  //       "blood_type": bloodType,
  //     },
  //   ).then((value) {
  //     emit(DonorSuccessState());
  //     nameController.clear();
  //     phoneNumberController.clear();
  //     bloodTypeController.clear();
  //     long = '';
  //     lat = '';
  //   }).catchError((e) {
  //     emit(DonorErrorState(e.toString()));
  //     print(e);
  //   });
  // }

  // void searchDonor(int currentIndex) async {
  //   emit(SearchDonorLoadingState());
  //   info = null;
  //   await DioHelper.getData(
  //     url: 'add-donor/${bloodKinds[currentIndex]}',
  //   ).then((value) {
  //     print(value.data);
  //     info = Blood.fromList(value.data);
  //     emit(SearchDonorSuccessState());
  //   }).catchError((e){
  //     emit(SearchDonorErrorState(e.toString()));
  //     print(e);
  //   });
  // }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied',
      );
    }
    return await Geolocator.getCurrentPosition();
  }
}

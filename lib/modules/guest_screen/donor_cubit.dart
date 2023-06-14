import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/constants/constants.dart';
import 'package:project/modules/guest_screen/donor_cubit_states.dart';
import '../../components/end_points.dart';

class DonorCubit extends Cubit<DonorCubitStates> {
  DonorCubit() : super(DonorInitialState());

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var longController = TextEditingController();
  var latController = TextEditingController();
  var bloodTypeController = TextEditingController();

  String? lat;
  String? long;



  static DonorCubit get(context) {
    return BlocProvider.of(context);
  }

  void addDonor({
    required String name,
    required String phoneNumber,
    required String long,
    required String lat,
    required String bloodType,

  }) async {
    emit(DonorLoadingState());
    await DioHelper.postData(
      url: donor,
      data: {
        "donor_name": name,
        "long": long,
        "lat": lat,
        "phone_number": phoneNumber,
        "blood_type": bloodType,
      },
    ).then((value) {
      emit(DonorSuccessState());
      nameController.clear();
      phoneNumberController.clear();
      bloodTypeController.clear();
      long = '';
      lat = '';
    }).catchError((e) {
      emit(DonorErrorState(e.toString()));
      print(e);
    });
  }


  void searchDonor(int currentIndex) async {
    emit(SearchDonorLoadingState());

    await DioHelper.getData(
      url: 'add-donor/${bloodKinds[currentIndex]}',
    ).then((value) {
      emit(SearchDonorSuccessState());
      print(value.data);
    }).catchError((e){
      emit(SearchDonorErrorState(e.toString()));
      print(e);
    });
  }


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

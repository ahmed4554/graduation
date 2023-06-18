import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project/components/components.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:project/modules/guest_screen/donor_cubit.dart';
import 'package:project/modules/guest_screen/donor_cubit_states.dart';
import 'package:project/modules/login_screen/cubit/states.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  String locationMessage = 'Current Location ';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/guest.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25, top: 70),
              child: const Text(
                "Hello",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Nunito'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 110),
              child: Row(
                children: [
                  const Text(
                    'Friend',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito'),
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  Image.asset(
                    'assets/images/child_app/child_home/wave.png',
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.46),
                child: BlocConsumer<DonorCubit, DonorCubitStates>(
                  listener: (context, state) {
                    if (state is GuestSuccessState) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            backgroundColor: Colors.grey.shade100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            children: <Widget>[
                              LottieBuilder(
                                lottie: AssetLottie(
                                  'assets/lotties/done_guest.json',
                                ),
                                width: 200,
                                height: 200,
                              ),
                              const Center(
                                child: Text(
                                  "Thank You",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    if (state is GuestErrorState) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            backgroundColor: Colors.grey.shade100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            children: <Widget>[
                              LottieBuilder(
                                lottie: AssetLottie(
                                  'assets/lotties/error.json',
                                ),
                                width: 200,
                                height: 200,
                                repeat: false,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              const Center(
                                child: Text(
                                  "Something Went Wrong!",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    var c = DonorCubit.get(context);
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomInputField(
                            type: TextInputType.text,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'The name can\'t be empty';
                              }
                            },
                            icon: Icons.person,
                            label: 'Name',
                            Controller: c.nameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomInputField(
                            type: TextInputType.text,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password is too short';
                              }
                            },
                            icon: Icons.phone,
                            label: 'Phone',
                            Controller: c.phoneNumberController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              c.getCurrentLocation().then((value) async {
                                c.lat = '${value.latitude}';
                                c.long = '${value.longitude}';
                              });
                              setState(() {
                                locationMessage =
                                    'Latitude : ${c.lat}\nLogitude : ${c.long}';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              height: 55.0,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8,
                                    offset: Offset(1.5, 1.5), // Shadow position
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black.withOpacity(.3),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    locationMessage,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(.3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomDropdown(
                            fillColor: Colors.grey.shade100,
                            errorText: 'Choose your blood type',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: 'Select Your Blood Type',
                            selectedStyle: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                            items: const [
                              'A+',
                              'A-',
                              'B+',
                              'B-',
                              'O+',
                              'O-',
                              'AB+',
                              'AB-'
                            ],
                            listItemStyle: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                            controller: c.bloodTypeController,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          MainButton(
                            label: 'Be A Donor',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                c.addDonor(
                                  name: c.nameController.text,
                                  phoneNumber: c.phoneNumberController.text,
                                  long: c.long!,
                                  lat: c.lat!,
                                  bloodType: c.bloodTypeController.text,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

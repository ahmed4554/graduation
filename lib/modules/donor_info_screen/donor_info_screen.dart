import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project/components/components.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/donor_list/donor_list_request.dart';
import 'package:project/modules/guest_screen/donor_cubit.dart';
import 'package:project/modules/guest_screen/donor_cubit_states.dart';
import 'package:project/modules/home/home_screen.dart';
import '../../constants/constants.dart';

class DonorInfoScreen extends StatefulWidget {
  const DonorInfoScreen({Key? key}) : super(key: key);

  @override
  State<DonorInfoScreen> createState() => _DonorInfoScreenState();
}

class _DonorInfoScreenState extends State<DonorInfoScreen> {

  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color(0xff1CB0F6),
              Color(0xffd0e7fc),
              Colors.white,
            ],
          ),
        ),
        child: BlocConsumer<DonorCubit,DonorCubitStates>(
          builder: (context , state){
            var c = DonorCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(
                            MaterialPageRoute(
                              builder: (context) =>  HomeScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                      ),
                      const SizedBox(
                        width: 90.0,
                      ),
                      const Text(
                        'Find Donor',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Search for blood donors around you ',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Choose Blood Group',
                  style: TextStyle(
                    fontSize: 25,
                    color: CustomColor.deepBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 320,
                  child: Wrap(
                    children: List.generate(
                      8,
                          (index) => InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            setState(() {});
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? CustomColor.blue11
                                : Colors.white,
                            boxShadow: currentIndex == index
                                ? const [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 0)),
                            ]
                                : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            bloodKinds[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: Column(
                      children:
                      [
                        const SizedBox(
                          height: 40,
                        ),
                        MainButton(
                          label: 'Search Donor',
                          width: double.infinity,
                          onTap: ()
                          {
                              c.searchDonor(currentIndex!);
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return  DonorListRequest();
                              }),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Lottie.asset(
                              'assets/lotties/blood_donation.json',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          listener: (context,state){},
        ),
      ),
    );
  }
}

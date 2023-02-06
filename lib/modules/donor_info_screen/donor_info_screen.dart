import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/components/components.dart';
import 'package:project/modules/donor_list/donor_list_request.dart';

import '../../constants/constants.dart';

class DonorInfoScreen extends StatelessWidget {
  const DonorInfoScreen({Key? key}) : super(key: key);

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
              Color(0xffB8EBCB),
              Color(0xffEEF8F2),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Find Donor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Text(
              'Search for blood donors around you ',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black.withOpacity(.3),
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
                color: Color(0xff32D74B),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 320,
              child: Wrap(
                children: List.generate(
                    8, (index) => BloodKindBubble(title: bloodKinds[index])),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Location',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff32D74B),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap:()
                      {

                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
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
                              'Press To Get your location',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black.withOpacity(.3),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MainButton(
                      label: 'Find Donor',
                      width: double.infinity,
                      onTap: ()
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return DonorlistRequest();
                          }),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MainButton(
                      label: 'Emergency Search',
                      width: double.infinity,
                    ),
                    Expanded(
                      child: Lottie.asset(
                          'assets/lotties/blood_donation.json'
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

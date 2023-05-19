import 'package:flutter/material.dart';

import '../../components/components.dart';

class DonorlistRequest extends StatelessWidget {
  const DonorlistRequest({Key? key}) : super(key: key);

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
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff58bff1),
              Color(0xffd0e7fc),
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  const Text(
                    'Donors List',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Found 14 Donors with B- in your location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4A4B4D),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: ((context, index) => const DonorInfo()
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

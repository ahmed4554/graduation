import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';

import '../../components/components.dart';

class DonorListRequest extends StatelessWidget {
  const DonorListRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColor.blue11,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:const  Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Donors List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15,),
          child: Expanded(
            child: ListView.separated(
              itemBuilder: ((context, index) => const BloodRequestComponent()),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}
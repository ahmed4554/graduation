import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/donor_list/blood.dart';
import 'package:project/modules/guest_screen/donor_cubit.dart';
import 'package:project/modules/guest_screen/donor_cubit_states.dart';

import '../../components/components.dart';

class DonorListRequest extends StatefulWidget {
  DonorListRequest({
    Key? key,
  }) : super(key: key);

  @override
  State<DonorListRequest> createState() => _DonorListRequestState();
}

class _DonorListRequestState extends State<DonorListRequest> {
  // Blood? info;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColor.blue11.withOpacity(.7),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
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
      body: BlocBuilder<DonorCubit, DonorCubitStates>(
        builder: (context, state) {
          var c = DonorCubit.get(context);
          return c.donors.isEmpty
              ? Center(
                  child: LottieBuilder.asset('assets/lotties/no_data.json'),
                )
              : Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: ListView.separated(
                      itemBuilder: ((context, index) => BloodRequestComponent(
                            receiveInfo: c.donors[index],
                          )),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: c.donors.length,
                    ),
                  ),
                );
        },
      ),
    );
  }
}

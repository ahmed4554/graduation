import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project/components/components.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/models/prescription_model/prescription_model.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/reminder/reminder.dart';
import 'package:project/utils/reminder_cubit/reminder_cubit.dart';
import 'package:project/utils/reminder_cubit/reminder_states.dart';

import '../../constants/constants.dart';

class PrescriptionHistory extends StatefulWidget {
  const PrescriptionHistory({Key? key}) : super(key: key);

  @override
  State<PrescriptionHistory> createState() => _PrescriptionHistoryState();
}

class _PrescriptionHistoryState extends State<PrescriptionHistory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PrescriptionScreen(),
            ),
          );
        },
        child: const Icon(Icons.add,color: Colors.white,),
        backgroundColor: CustomColor.blue11,
      ),
      backgroundColor: Color(0xffF4F9EA),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F9EA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: CustomColor.blue11,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        title: Text(
          'Patient History',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        child: Column(
          children: [
            // Container(
            //   width: 350.0,
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.shade400,
            //         spreadRadius: 0,
            //         blurRadius: 20,
            //         offset: Offset.zero,
            //       )
            //     ],
            //   ),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //         fillColor: Colors.white,
            //         filled: true,
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(30.0),
            //           borderSide: BorderSide.none,
            //         ),
            //         hintText: 'Search',
            //         prefixIcon: const Icon(
            //           Icons.search,
            //           color: CustomColor.blue11,
            //         ),
            //         suffixIcon: IconButton(
            //           icon: const Icon(
            //             Icons.add,
            //             color: CustomColor.blue11,
            //           ),
            //           onPressed: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) => const PrescriptionScreen(),
            //               ),
            //             );
            //           },
            //         )),
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(model!.id)
                  .collection('prescriptions')
                  .orderBy(
                    'date',
                    descending: false,
                  )
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: LottieBuilder.asset('assets/lotties/no_data.json'),
                  );
                } else if (snapshot.data!.docs.isNotEmpty) {
                  return Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      backgroundColor: Colors.grey.shade100,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          child: Center(
                                            child: InteractiveViewer(
                                              child: CachedNetworkImage(
                                                imageUrl: snapshot
                                                    .data!.docs[index]
                                                    .data()['image'],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Center(
                                          child: Text(
                                            'Title : ${snapshot.data!.docs[index].data()['title']}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Center(
                                          child: Text(
                                            'Date : ${snapshot.data!.docs[index].data()['date'].substring(0, 10)}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Center(
                                          child: Text(
                                            'descritpion : ${snapshot.data!.docs[index].data()['desc']}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: PrescriptionComponent(
                                  model: PrescriptionModel.fromJson(
                                      snapshot.data!.docs[index].data())),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: snapshot.data!.docs.length),
                  ));
                } else if (snapshot.hasError) {
                  return Center(
                    child: LottieBuilder.asset('assets/lotties/no_data.json'),
                  );
                } else {
                  return Center(
                    child: LottieBuilder.asset('assets/lotties/no_data.json'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

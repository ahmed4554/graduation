
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/constants/constants.dart';
import 'package:project/modules/home/home_screen.dart';

import '../../components/components.dart';
import '../../models/follow_child_model/follow_child_model.dart';

class FollowChildProgress extends StatelessWidget {
  const FollowChildProgress({super.key});

  final Radius radius = const Radius.circular(30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          },
        ),
        title: const Text(
          'Child\'s Progress',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 20.0,
        ),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 102.0,
                  height: 102.0,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset.zero,
                    )
                  ], borderRadius: BorderRadius.circular(50.0)),
                  child: CachedNetworkImage(
                      imageUrl:
                      model!.image!,
                    ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  'You Can See Which Category Your Child Browse.',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'You Can See Where He Arrived In His Educational Trip.',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc('following')
                      .collection('educationBoard')
                      .doc(model!.id)
                      .snapshots(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if (snapshot.data == null || snapshot.data.data() == null) {
                      return LottieBuilder.asset(
                        'assets/lotties/errort.json',
                      );
                    } else if (snapshot.hasData) {
                      return FollowChildComponent(
                        model:
                            FollowChildModel.fromJson(snapshot.data!.data()!),
                      );
                    } else if (snapshot.hasError) {
                      return LottieBuilder.asset(
                        'assets/lotties/errort.json',
                      );
                    } else {
                      return LottieBuilder.asset(
                        'assets/lotties/errort.json',
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

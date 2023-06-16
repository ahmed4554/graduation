import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/home/home_screen.dart';

import '../../components/components.dart';
import '../../models/follow_child_model/follow_child_model.dart';

class FollowChildProgress extends StatelessWidget {
  const FollowChildProgress({super.key});

  final Radius radius = const Radius.circular(30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: ()
          {
            Navigator.of(context).pop(
              MaterialPageRoute(builder: (context)
                {
                  return HomeScreen();
                },
              ),
            );
          },
        ),
        title: const Text(
          'Child\'s Progress',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        backgroundColor: CustomColor.blue11.withOpacity(.8),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            //color: CustomColor.blue11.withOpacity(.8),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:
              [
                CustomColor.blue11.withOpacity(.8),
                Colors.white,
              ],
              stops: const [.4,.6],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 102.0,
                height: 102.0,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset.zero,
                      )
                    ],
                    borderRadius: BorderRadius.circular(50.0)),
                child: Image.asset(
                  "assets/images/profile/eliza.png",
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                'You Can See Which Category Your Child Browse.',
                style: TextStyle(
                  fontSize: 19.0,
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
                  fontSize: 18.0,
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
                      .doc('levelOne')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      log(snapshot.data!.data().toString());
                      return FollowChildComponent(
                        model: FollowChildModel.fromJson(snapshot.data!.data()!),
                      );
                    } else if (snapshot.hasError) {
                      print(snapshot.error.toString());
                      return LottieBuilder.asset(
                          'assets/lotties/errort.json',
                      );
                    } else
                    {
                      return LottieBuilder.asset(
                        'assets/lotties/errort.json',
                      );
                    }
                  },
               ),
              const Spacer(),
              SizedBox(
                width: 20.0,
                  child: Divider(
                    thickness: 2.5,
                    color: CustomColor.blue11.withOpacity(.8),
                  ),
              ),
              SizedBox(
                width: 60.0,
                  child: Divider(
                    thickness: 2.5,
                    color: CustomColor.blue11.withOpacity(.8),
                  ),
              ),
              SizedBox(
                width: 100.0,
                  child: Divider(
                    thickness: 2.5,
                    color: CustomColor.blue11.withOpacity(.8),
                  ),
              ),
              SizedBox(
                width: 140.0,
                  child: Divider(
                    thickness: 2.5,
                    color: CustomColor.blue11.withOpacity(.8),
                  ),
              ),
              SizedBox(
                width: 180.0,
                  child: Divider(
                    thickness: 2.5,
                    color: CustomColor.blue11.withOpacity(.8),
                  ),
              ),
              SizedBox(
                width: 220.0,
                  child: Divider(
                    thickness: 2.5,
                    color: CustomColor.blue11.withOpacity(.8),
                  ),
              ),
              SizedBox(
                width: 260.0,
                  child: Divider(
                    thickness: 2.5,
                    color: CustomColor.blue11.withOpacity(.8),
                  ),
              ),
              SizedBox(
                width: 300.0,
                  child: Divider(
                    thickness: 2.5,
                    color: CustomColor.blue11.withOpacity(.8),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

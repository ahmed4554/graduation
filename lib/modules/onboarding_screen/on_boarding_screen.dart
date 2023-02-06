import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/access_screen/access_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login_screen/login_screen.dart';

class BoardingModel {
  final String image;
  final String image2;
  final String title;
  final String body;
  final String body2;

  BoardingModel({
    required this.image,
    this.image2 = '',
    required this.title,
    required this.body,
    required this.body2,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onBoarding/education.svg',
        title: 'Education',
        body : 'Helps The Child To Learn In A Simple And Funny Ways.',
        body2:'Learning Him How To Pronounce Speech.',
    ),
    BoardingModel(
        image: 'assets/images/onBoarding/face.svg',
        title: 'Face Recognition',
        body : 'Helping The Child To Log In Without Writing The Account.',
        body2: ' And Finding The Child In Case He Is Lost'
    ),
    BoardingModel(
        image2: 'assets/images/onBoarding/cloud.svg',
        image: 'assets/images/onBoarding/office.svg',
        title: 'Object Detection',
        body : 'Enable The Child To Know The Names Of The Tools To',
        body2: 'Facilitate Interaction And Integration Into Society.'
    ),
  ];

  bool isLast = false;

  // void submit() {
  //   CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
  //     if (value) {
  //       Navigator.of(context)
  //           .pushReplacement(MaterialPageRoute(builder: (context) {
  //         return LoginScreen();
  //       }));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: boardController,
                effect: const ExpandingDotsEffect(
                  activeDotColor: CustomColor.deepGreen,
                  dotColor: Colors.grey,
                  dotHeight: 14,
                  expansionFactor: 4,
                  dotWidth: 16,
                  spacing: 5.0,
                ),
                count: boarding.length,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Row(
              children:
              [
                TextButton(
                  onPressed: ()
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AccessScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                      'Skip',
                    style: TextStyle(
                        color: CustomColor.deepGreen,
                        fontSize: 24.0
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 45.0,
                  width: 90.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: MaterialButton(
                    color: CustomColor.deepGreen,
                    onPressed: ()
                    {
                      if (isLast == true)
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          SizedBox(
            height: 60.0,
          ),
          Center(
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    (model.image2),
                  ),
                ),
                Center(
                  child: SvgPicture.asset(
                    (model.image),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              model.title,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 65.0,
          ),
          Center(
            child: Column(
              children:
              [
                Text(
                  model.body,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  model.body2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

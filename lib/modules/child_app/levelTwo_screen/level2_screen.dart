import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';

class LevelTwoScreen extends StatelessWidget {
  const LevelTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            height: 290.0,
            decoration: BoxDecoration(
                color:CustomColor.blue11.withOpacity(.8),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(110.0),
                  bottomLeft: Radius.circular(110.0),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 45.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Row(
                  children:
                  [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 100.0,
                    ),
                    Text(
                      'Level 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  children:
                  [
                    Text(
                      'Let\'s study',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children:
                  [
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Stack(
                        children:
                        [
                          Container(
                            height: 200.0 ,
                            width: 165.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(1.5, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 29.0,
                            ),
                            child: Container(
                              height: 106.0 ,
                              width: 106.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(55.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 9,
                                    offset: const Offset(.5, .5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/child_app/level_one/abc.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 123.0,
                              left: 55.0,
                            ),
                            child: Text(
                              'Alphabet',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 143.0,
                              left: 55.0,
                            ),
                            child: Text(
                              '20 / 26',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 172.0,
                              left: 12.0,
                            ),
                            child: SizedBox(
                              width: 140.0,
                              child: LinearProgressIndicator(
                                minHeight: 5.0,
                                color: Colors.orange.shade500.withOpacity(.9),
                                backgroundColor: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Stack(
                        children:
                        [
                          Container(
                            height: 200.0 ,
                            width: 165.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(1.5, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 29.0,
                            ),
                            child: Container(
                              height: 106.0 ,
                              width: 106.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(55.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 9,
                                    offset: const Offset(.5, .5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/child_app/level_one/numbers.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 123.0,
                              left: 55.0,
                            ),
                            child: Text(
                              'Numbers',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 143.0,
                              left: 59.0,
                            ),
                            child: Text(
                              '1 / 12',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 172.0,
                              left: 12.0,
                            ),
                            child: SizedBox(
                              width: 140.0,
                              child: LinearProgressIndicator(
                                minHeight: 5.0,
                                color: Colors.red.shade600.withOpacity(.9),
                                backgroundColor: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children:
                  [
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Stack(
                        children:
                        [
                          Container(
                            height: 200.0 ,
                            width: 165.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(1.5, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 29.0,
                            ),
                            child: Container(
                              height: 106.0 ,
                              width: 106.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(55.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 9,
                                    offset: const Offset(.5, .5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/child_app/level_one/shapes.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 123.0,
                              left: 59.0,
                            ),
                            child: Text(
                              'Shapes',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 143.0,
                              left: 59.0,
                            ),
                            child: Text(
                              '7 / 10',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 172.0,
                              left: 12.0,
                            ),
                            child: SizedBox(
                              width: 140.0,
                              child: LinearProgressIndicator(
                                minHeight: 5.0,
                                color: Colors.blue.shade600.withOpacity(.9),
                                backgroundColor: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Stack(
                        children:
                        [
                          Container(
                            height: 200.0 ,
                            width: 165.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(1.5, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 29.0,
                            ),
                            child: Container(
                              height: 106.0 ,
                              width: 106.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(55.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 9,
                                    offset: const Offset(.5, .5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/child_app/level_two/lion.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 123.0,
                              left: 59.0,
                            ),
                            child: Text(
                              'Animals',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 143.0,
                              left: 65.0,
                            ),
                            child: Text(
                              '1 / 5',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 172.0,
                              left: 12.0,
                            ),
                            child: SizedBox(
                              width: 140.0,
                              child: LinearProgressIndicator(
                                minHeight: 5.0,
                                color: Colors.green.shade500.withOpacity(.9),
                                backgroundColor: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children:
                  [
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Stack(
                        children:
                        [
                          Container(
                            height: 200.0 ,
                            width: 165.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(1.5, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 29.0,
                            ),
                            child: Container(
                              height: 106.0 ,
                              width: 106.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(55.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 9,
                                    offset: const Offset(.5, .5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/child_app/level_two/rgb.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 123.0,
                              left: 63.0,
                            ),
                            child: Text(
                              'Colors',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 143.0,
                              left: 61.0,
                            ),
                            child: Text(
                              '7 / 10',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 172.0,
                              left: 12.0,
                            ),
                            child: SizedBox(
                              width: 140.0,
                              child: LinearProgressIndicator(
                                minHeight: 5.0,
                                color: Colors.deepPurple.shade600.withOpacity(.9),
                                backgroundColor: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Stack(
                        children:
                        [
                          Container(
                            height: 200.0 ,
                            width: 165.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(1.5, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 29.0,
                            ),
                            child: Container(
                              height: 106.0 ,
                              width: 106.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(55.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 9,
                                    offset: const Offset(.5, .5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/child_app/level_two/fruits.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 123.0,
                              left: 66.0,
                            ),
                            child: Text(
                              'Fruits',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 143.0,
                              left: 61.0,
                            ),
                            child: Text(
                              '4 / 10',
                              style: TextStyle(
                                color: CustomColor.sky1,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 172.0,
                              left: 12.0,
                            ),
                            child: SizedBox(
                              width: 140.0,
                              child: LinearProgressIndicator(
                                minHeight: 5.0,
                                color: Colors.cyan.shade500.withOpacity(.9),
                                backgroundColor: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

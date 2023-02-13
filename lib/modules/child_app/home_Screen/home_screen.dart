import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/child_app/levels_screen/levels_screen.dart';

class ChildHomeScreen extends StatelessWidget {
  const ChildHomeScreen({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Education',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 21.0,
                ),
                const Text(
                  'Hello,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito'
                  ),
                ),
                Row(
                  children:
                  [
                    const Text(
                      'Dear',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito'
                      ),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    Image.asset(
                        'assets/images/child_app/child_home/wave.png',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children:
                  [
                    InkWell(
                      onTap: ()
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => LevelsScreen()
                          ),
                        );
                      },
                      child: Stack(
                        children: [
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
                              left: 15.0,
                            ),
                            child: Image.asset(
                              'assets/images/child_app/child_home/education.png',
                              height: 142.0,
                              width: 142.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 170,
                                left: 53.0,
                            ),
                            child: Text(
                              'Education',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Stack(
                      children: [
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
                            top: 16.0,
                            left: 12.0,
                          ),
                          child: Image.asset(
                            'assets/images/child_app/child_home/recognition.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 170,
                              left: 31.0,
                          ),
                          child: Text(
                            'Object Detection',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children:
                  [
                    SizedBox(
                      width: 181.0,
                    ),
                    Stack(
                      children: [
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
                            left: 11.0,
                          ),
                          child: Image.asset(
                            'assets/images/child_app/child_home/conversation.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 170,
                              left: 53.0,
                          ),
                          child: Text(
                            'Chat Bot',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
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

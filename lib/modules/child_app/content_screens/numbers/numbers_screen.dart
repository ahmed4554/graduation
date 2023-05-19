import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/constants/constants.dart';
import 'package:project/modules/child_app/board_screen/board_screen.dart';
import 'package:project/modules/child_app/content_screens/numbers/numbers.dart';
import 'package:project/modules/child_app/levelOne_screen/level1_screen.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({Key? key}) : super(key: key);

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {

  Numbers? num;

  @override
  void initState() {
    setState(() {
      num = Numbers.fromJson(numbers);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.blue11.withOpacity(.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: ()
          {
            Navigator.of(context).pop(
              MaterialPageRoute(builder: (context) {
                return const LevelOneScreen();
              }),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Education',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .35,
            // height: 350.0,
            decoration: BoxDecoration(
              // color: CustomColor.blue11.withOpacity(.8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColor.blue11.withOpacity(.8),
                  Colors.white,
                ],
                stops: const [.4,.6],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

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
                    height: 15.0,
                  ),
                  Container(
                    width: 120.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset.zero,
                        )
                      ],
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Numbers',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.1,
                      children: List.generate(
                        num!.shapes!.length,
                            (index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder:
                                  (context) {
                                SystemChrome.setPreferredOrientations(
                                    [
                                      DeviceOrientation.landscapeLeft,
                                    ]
                                );
                                return BoardScreen(
                                  board: num ,
                                  index: index,
                                );
                              },
                              ),
                            );
                          },
                          child: Container(
                            height: 140.0,
                            width: 100.0,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.7),
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.5),
                                  spreadRadius: 0,
                                  blurRadius: 7,
                                  offset: Offset.zero,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 18.0,
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 90.0,
                                      height: 90.0,
                                      child: Image.asset(
                                        num!.shapes![index],
                                      ),
                                    ),
                                    // Text(
                                    //   num!.names![index],
                                    //   style: const TextStyle(
                                    //     fontSize: 24.0,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

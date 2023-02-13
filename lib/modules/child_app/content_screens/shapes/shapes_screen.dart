import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/constants/constants.dart';
import 'package:project/modules/child_app/board_screen/board_screen.dart';
import 'package:project/modules/child_app/content_screens/shapes/shapes.dart';

class ShapesScreen extends StatefulWidget {

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
  Shapes? content;
  @override
  void initState() {
    setState(() {
      SystemChrome.setPreferredOrientations(
          [
            DeviceOrientation.portraitUp,
          ]
      );
    });
    setState(()
    {
      content = Shapes.fromJson(shapes);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            height: 330.0,
            decoration: BoxDecoration(
                color:CustomColor.blue11.withOpacity(.8),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(110.0),
                  bottomLeft: Radius.circular(110.0),
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              Padding(
                padding: const EdgeInsets.only(
                    top: 45.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  children:
                  [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 99.0,
                    ),
                    Center(
                      child: Text(
                        'Education',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 102.0,
                  height: 102.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                  child: Image.asset(
                    "assets/images/profile/eliza.png",
                  ),
               ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 140.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)
                ),
                child: Center(
                  child: Text(
                    'Shapes',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 500.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 20.0,
                      ),
                      children:
                        List.generate(
                         content!.names!.length, (index) => InkWell(
                          onTap: ()
                          {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder:
                                  (context) {
                                SystemChrome.setPreferredOrientations(
                                    [
                                      DeviceOrientation.landscapeLeft,
                                    ]
                                );
                                    return BoardScreen(
                                    board: content!,
                                    index: index,
                                  );
                                  },
                              ),
                            );
                          },
                           child: Container(
                            height: 140.0 ,
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 6,
                                  offset: Offset(1.5, 1.5), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: Center(
                                child: Column(
                                  children:
                                  [
                                    Container(
                                      width: 90.0,
                                      height: 90.0,
                                      child: Image.asset(
                                          content!.shapes![index],
                                      ),
                                    ),
                                    Text(
                                      content!.names![index],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ) ,
                           ),
                         ),
                        ),
                     ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

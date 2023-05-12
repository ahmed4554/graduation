import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';

class ActivityLevels extends StatelessWidget {
  const ActivityLevels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
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
          ),
          Padding(
            padding: const EdgeInsets.only(
                top:50.0,
               left: 20.0,
              right: 20.0,
              bottom: 20.0
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                  [
                    Container(
                      color: Colors.deepOrange,
                      child: const Text(
                        'P',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/constants.dart';

import '../../components/custom_color.dart';

class NotifyScreen extends StatefulWidget {
  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  int? currentIndex;
  List<DateTime> dates = [];
  List<TimeOfDay> times = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                const Text(
                  'Set Medicine Reminder',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Medicine Name',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 303.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Medicine Name Here',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 30.0,
            //   ),
            // //   child: Text(
            // //     'Repeat',
            // //     style: TextStyle(
            // //       color: Colors.black.withOpacity(.6),
            // //       fontSize: 22,
            // //     ),
            // //   ),
            // // ),
            // // SizedBox(
            // //   height: 5.0,
            // // ),
            // Container(
            //   width: double.infinity,
            //   child: Row(
            //     children: List.generate(
            //       7,
            //       (index) => InkWell(
            //         onTap: () {
            //           setState(() {
            //             currentIndex = index;
            //           });
            //         },
            //         child: Container(
            //           margin: const EdgeInsets.all(6),
            //           alignment: Alignment.center,
            //           width: 40,
            //           height: 40,
            //           decoration: BoxDecoration(
            //             color: currentIndex == index
            //                 ? CustomColor.blue11
            //                 : Colors.white,
            //             boxShadow: currentIndex == index
            //                 ? const [
            //                     BoxShadow(
            //                         color: Colors.black26,
            //                         blurRadius: 5,
            //                         spreadRadius: 1,
            //                         offset: Offset(0, 0)),
            //                   ]
            //                 : null,
            //             borderRadius: BorderRadius.circular(9),
            //             border: currentIndex == index
            //                 ? Border.all(
            //                     color: Colors.transparent,
            //                   )
            //                 : Border.all(
            //                     color: Colors.black.withOpacity(.6),
            //                   ),
            //           ),
            //           child: Text(
            //             weakDays[index],
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.black.withOpacity(.6),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 303.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: TextField(
                          // decoration: InputDecoration(),
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoDatePicker(
                              onDateTimeChanged: (value) {
                                print(dates.toString());
                                if (dates.contains(value) == false) {
                                  return dates.add(value);
                                }
                              },
                              use24hFormat: true,
                              backgroundColor: Colors.white,
                            ),
                          );
                        },
                        child: Text(
                          'pick date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.blue11,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

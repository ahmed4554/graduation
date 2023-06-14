import 'package:flutter/material.dart';
import 'package:project/modules/chat/chat_screen.dart';
import '../../components/custom_color.dart';
import '../donor_info_screen/donor_info_screen.dart';
import '../healthy_food/healthy_food.dart';
import '../reminder_history/reminder_history.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: CustomColor.blue11,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 90.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.9),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    topLeft: Radius.circular(50.0),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 110.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                              color: CustomColor.blue11,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(60.0),
                                bottomRight: Radius.circular(60.0),
                              )),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 90.0,
                          width: 100.0,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Center(
                    child: Text(
                      'Welcome',
                      style: TextStyle(fontSize: 38.0),
                    ),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            InkWell(
                              onTap: ()
                              {

                              },
                              child: Container(
                                width: 343.0,
                                height: 90.29,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.9),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 9,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 36.0,
                                        left: 30.0,
                                      ),
                                      child: Text(
                                        'Follow Your Child',
                                        style: TextStyle(
                                          color: CustomColor.black1
                                              .withOpacity(0.8),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 90.0,
                                      height: 112.0,
                                      child: Image.asset(
                                          'assets/images/parentHome/parents.png'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return const DonorInfoScreen();
                                  }),
                                );
                              },
                              child: Container(
                                width: 343.0,
                                height: 90.29,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.9),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 9,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 90.0,
                                      height: 112.0,
                                      child: Image.asset(
                                          'assets/images/parentHome/blood.png'),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 36.0,
                                        right: 30.0,
                                      ),
                                      child: Text(
                                        'Blood Donation',
                                        style: TextStyle(
                                          color: CustomColor.black1
                                              .withOpacity(0.8),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PrescriptionHistory(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 343.0,
                                height: 90.29,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.9),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 9,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 110.0,
                                      height: 90.0,
                                      child: Image.asset(
                                          'assets/images/parentHome/board.png'),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 36.0,
                                        right: 30.0,
                                      ),
                                      child: Text(
                                        'Reminder',
                                        style: TextStyle(
                                          color: CustomColor.black1
                                              .withOpacity(0.8),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return const HealthyFoodScreen();
                                  }),
                                );
                              },
                              child: Container(
                                width: 343.0,
                                height: 90.29,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.9),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 9,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 36.0,
                                        left: 30.0,
                                      ),
                                      child: Text(
                                        'Healthy Food',
                                        style: TextStyle(
                                          color: CustomColor.black1
                                              .withOpacity(0.8),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 179.0,
                                      height: 134.0,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 79,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Image.asset(
                                              'assets/images/parentHome/salad.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return const Chat();
                                  }),
                                );
                              },
                              child: Container(
                                width: 343.0,
                                height: 90.29,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.9),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 9,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 110.0,
                                      height: 90.0,
                                      child: Image.asset(
                                          'assets/images/parentHome/chat.png'),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 36.0,
                                        right: 30.0,
                                      ),
                                      child: Text(
                                        'Chat Group',
                                        style: TextStyle(
                                          color: CustomColor.black1
                                              .withOpacity(0.8),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                          ],
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

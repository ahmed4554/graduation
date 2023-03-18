import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/about_us/about_us.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColor.blue11,
              Color(0xffbed9ef),
              Color(0xffFFFFFF),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                children:
                [
                  Icon(
                      Icons.settings,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: SizedBox(
                  width: 314.0,
                  child: Divider(
                    color: Colors.black,
                    thickness: 1.0,
                    endIndent: 49.0,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: ()
                {

                },
                child: Container(
                  width: 330.0,
                  height: 66.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0,
                    ),
                    child: Row(
                      children:
                      [
                        SizedBox(
                          width: 45.0,
                          height: 45.31,
                          child: Image.asset(
                              'assets/images/settings/ring.png',
                          ),
                        ),
                        SizedBox(
                          width: 26.0,
                        ),
                        Text(
                          'Notification',
                          style: TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              InkWell(
                onTap: ()
                {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return AboutUsScreen();
                    }),
                  );
                },
                child: Container(
                  width: 330.0,
                  height: 66.0,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children:
                      [
                        SizedBox(
                          width: 45.0,
                          height: 45.31,
                          child: Image.asset(
                              'assets/images/settings/about.png',
                          ),
                        ),
                        SizedBox(
                          width: 26.0,
                        ),
                        Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              InkWell(
                onTap: ()
                {

                },
                child: Container(
                  width: 330.0,
                  height: 66.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0,
                    ),
                    child: Row(
                      children:
                      [
                        SizedBox(
                          width: 45.0,
                          height: 45.31,
                          child: Image.asset(
                              'assets/images/settings/help.png',
                          ),
                        ),
                        SizedBox(
                          width: 26.0,
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              InkWell(
                onTap: ()
                {

                },
                child: Container(
                  width: 330.0,
                  height: 66.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0,
                    ),
                    child: Row(
                      children:
                      [
                        SizedBox(
                          width: 45.0,
                          height: 45.31,
                          child: Image.asset(
                              'assets/images/settings/friend.png',
                          ),
                        ),
                        SizedBox(
                          width: 26.0,
                        ),
                        Text(
                          'Invite Friends',
                          style: TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                width: 330.0,
                height: 66.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0,
                  ),
                  child: Row(
                    children:
                    [
                      SizedBox(
                        width: 45.0,
                        height: 45.31,
                        child: Image.asset(
                            'assets/images/settings/logout.png',
                        ),
                      ),
                      SizedBox(
                        width: 26.0,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(
                            fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

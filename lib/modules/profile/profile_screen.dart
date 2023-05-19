import 'package:flutter/material.dart';
import 'package:project/components/components.dart';
import 'package:project/components/custom_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomColor.blue11,
                Color(0xffccdfef),
                Color(0xffFFFFFF),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 20.0,
              right: 20.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Row(
                  children:
                  [
                    const Icon(
                        Icons.person_outline_rounded,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 31.0,
                      height: 30.0,
                      child: Image.asset(
                          'assets/images/profile/check.png',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      Stack(
                        children:
                        [
                          SizedBox(
                            width: 125.0,
                            height: 125.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(65.0),
                              child: Image.asset(
                                'assets/images/profile/eliza.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 82.0,
                              left: 84.0,
                            ),
                            child: Container(
                              width: 42.0,
                              height: 42.0,
                              decoration: BoxDecoration(
                               // color: CustomColor.green1,
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffbce1ec),
                                    Color(0xffbce1ec),
                                  ],
                                ),
                                border: Border.all(
                                  color: Colors.transparent
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child:const Icon(
                                Icons.camera_alt,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                          'Elizabeth Alpy',
                        style: TextStyle(
                          fontSize: 27.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          TextButton(
                            onPressed: ()
                            {

                            },
                            child: const Text(
                              'Edit profile',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: CustomColor.blue11,
                            ),
                           ),
                          ),
                          const Icon(
                              Icons.edit,
                            color: CustomColor.blue11,
                            size: 20.0,
                          ),
                        ],
                      ),
                      const CustomInputField(
                          icon: Icons.person,
                          label: 'User name',
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const CustomInputField(
                          icon: Icons.lock_open_rounded,
                          label: 'Password',
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const CustomInputField(
                          icon: Icons.email_outlined,
                          label: 'Email',
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const CustomInputField(
                          icon: Icons.phone_android_rounded,
                          label: 'Phone number',
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

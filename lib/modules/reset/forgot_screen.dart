import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/components/components.dart';
import 'package:project/modules/login_screen/login_screen.dart';
import 'package:project/modules/reset/verify_screen.dart';

import '../login_screen/cubit/cubit.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1CB0F6),
                Color(0xffEEF8F2),
                Color(0xffFFFFFF),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 150,
                  height: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(.9),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Column(
                  children: [
                    Text(
                      'Enter the phone number linked to your account. ',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'We will send 4 digits code to your number. ',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                CustomInputField(
                  icon: Icons.phone,
                  label: 'Phone Number',
                  validate: (String? value) {},
                  type: TextInputType.phone,
                  Controller: LoginCubit.get(context).phoneController,
                ),
                SizedBox(
                  height: 40,
                ),
                MainButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return VerificationScreen();
                        },
                      ),
                    );
                  },
                  label: 'Send Code',
                  width: 250,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 285,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/components/components.dart';
import 'package:project/modules/login_screen/login_screen.dart';
import 'package:project/modules/reset/verify_screen.dart';

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
            padding: const EdgeInsets.symmetric(
                horizontal: 24.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children:
                  [
                    GestureDetector(
                      child: const Icon(Icons.arrow_back),
                      onTap: ()
                      {
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 150,
                  height: 100,
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 26,
                ),
                const Column(
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
                const SizedBox(
                  height: 40,
                ),
                const CustomInputField(
                  icon: Icons.phone,
                  label: 'Phone Number',
                ),
                const SizedBox(
                  height: 40,
                ),
                MainButton(
                  onTap: ()
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const VerificationScreen();
                        },
                      ),
                    );
                  },
                  label: 'Send Code',
                  width: 250,
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/reset/newpass_screen.dart';

import '../../components/components.dart';
import '../login_screen/login_screen.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff9CDFB5),
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
                SizedBox(
                  height: 50,
                ),
                Row(
                  children:
                  [
                    GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: ()
                      {
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
                  'OTP Authentication',
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
                      'The code has been sent to 010******21. ',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Check your mobile number and continue . ',
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
                TextEditorForVerifyCode(),
                // Row(
                //   children:
                //   [
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Opacity(
                //       opacity: 0.4,
                //       child: Container(
                //         height: 64.0,
                //         width: 64.0,
                //         decoration:  BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(12)),
                //           color: Colors.grey[500],
                //         ),
                //         child: Padding(
                //           padding: EdgeInsets.only(
                //             top: 5.0,
                //               left: 10.0,
                //               right: 10.0,
                //           ),
                //           child: TextEditorForPhoneVerify(),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 14,
                //     ),
                //     Opacity(
                //       opacity: 0.4,
                //       child: Container(
                //         height: 64.0,
                //         width: 64.0,
                //         decoration:  BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(12)),
                //           color: Colors.grey[500],
                //         ),
                //         child: Padding(
                //           padding: EdgeInsets.only(
                //             top: 5.0,
                //               left: 10.0,
                //               right: 10.0,
                //           ),
                //           child: TextEditorForPhoneVerify(),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 14,
                //     ),
                //     Opacity(
                //       opacity: 0.4,
                //       child: Container(
                //         height: 64.0,
                //         width: 64.0,
                //         decoration:  BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(12)),
                //           color: Colors.grey[500],
                //         ),
                //         child: Padding(
                //           padding: EdgeInsets.only(
                //             top: 5.0,
                //               left: 10.0,
                //               right: 10.0,
                //           ),
                //           child: TextEditorForPhoneVerify(),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 14,
                //     ),
                //     Opacity(
                //       opacity: 0.4,
                //       child: Container(
                //         height: 64.0,
                //         width: 64.0,
                //         decoration:  BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(12)),
                //           color: Colors.grey[500],
                //         ),
                //         child: Padding(
                //           padding: EdgeInsets.only(
                //             top: 5.0,
                //               left: 10.0,
                //               right: 10.0,
                //           ),
                //           child: TextEditorForPhoneVerify(),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 50,
                ),
                MainButton(
                  onTap: ()
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return NewPasswordScreen();
                        },
                      ),
                    );
                  },
                  label: 'Confirm',
                  width: 250,
                ),
                SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

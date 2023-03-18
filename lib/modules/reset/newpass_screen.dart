import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/modules/home/home_screen.dart';
import '../../components/components.dart';
import '../login_screen/login_screen.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

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
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(.9),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Set the new password for your account so  ',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'you can log in and access all features. ',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                CustomInputField(
                  icon: Icons.lock_open_rounded,
                  label: 'Enter new password',
                ),
                SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  icon: Icons.lock_open_rounded,
                  label: 'Confirm password',
                ),
                SizedBox(
                  height: 40,
                ),
                MainButton(
                  onTap: ()
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  label: 'Reset Password',
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

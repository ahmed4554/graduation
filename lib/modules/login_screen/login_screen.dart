import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/register_screen/register_screen.dart';
import 'package:project/modules/reset/forgot_screen.dart';
import '../../components/components.dart';
import '../bottomNav/bottomNav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool check = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 300,
                height: 250,
              ),
              const SizedBox(
                height: 15,
              ),
              const AppName(),
              const SizedBox(
                height: 15,
              ),
              // CustomBorder(),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Form(
                  child: Column(
                    children: [
                      const CustomInputField(
                        icon: Icons.person,
                        label: 'User name',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomInputField(
                        icon: Icons.lock_open_rounded,
                        label: 'Password',
                      ),
        
                      Row(
                        children: [
                          Checkbox(
                            value: check,
                            onChanged: (bool? value)
                            {
                              setState(() {
                                check = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 2,
                          // ),
                          Text(
                            'Stay signed in',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(.45),
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            child: const Text(
                                'Forgot password ?',
                              style: TextStyle(
                                fontSize: 15,
                                color: CustomColor.blue11,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: ()
                            {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ResetScreen();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   height: 5,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       border: Border.all(
                      //         color: Colors.black38,
                      //         width: 1,
                      //       )),
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      MainButton(
                        label: 'Log In',
                        onTap: ()
                        {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const MainPage();
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account ? ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(.45),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisterScreen();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                fontSize: 15,
                                color: CustomColor.blue11,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

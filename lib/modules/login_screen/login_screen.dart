import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/login_screen/cubit/cubit.dart';
import 'package:project/modules/login_screen/cubit/states.dart';
import 'package:project/modules/register_screen/register_screen.dart';
import 'package:project/modules/reset/forgot_screen.dart';
import '../../components/components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key,}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomInputField(
                              Controller: LoginCubit.get(context).emailController,
                              icon: Icons.email_outlined,
                              label: 'Email Address',
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email address';
                                }
                              },
                              type: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomInputField2(
                              passwordController: LoginCubit.get(context).passwordController,
                              icon: Icons.lock_open_rounded,
                              icon2: LoginCubit.get(context).suffix,
                              suffixPressed: ()
                              {
                                LoginCubit.get(context).changePasswordVisibility();
                              },
                              suffixColor: LoginCubit.get(context).isPassword ? Colors.grey : CustomColor.blue11 ,
                              label: 'Password',
                              type: TextInputType.visiblePassword,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Password is too short';
                                }
                              },
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: LoginCubit.get(context).check,
                                  onChanged: (bool? value)
                                  {
                                     LoginCubit.get(context).checkLog(value!);
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
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ResetScreen();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => MainButton(
                                label: 'Log In',
                                onTap: ()
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    LoginCubit.get(context).userLogin(
                                      email: LoginCubit.get(context).emailController.text,
                                      password: LoginCubit.get(context).passwordController.text,
                                    );
                                  }
                                },
                              ),
                              fallback: (context) => CircularProgressIndicator(),
                            ),
                            const SizedBox(
                              height: 15,
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
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return RegisterScreen();
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

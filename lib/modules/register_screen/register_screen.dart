import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/login_screen/cubit/cubit.dart';
import 'package:project/modules/register_screen/cubit/cubit.dart';
import 'package:project/modules/register_screen/cubit/states.dart';
import '../../components/components.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterCubitState>(
        listener: (context, state) {},
        builder: (context, state) => Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1CB0F6),
                Color(0xfff5fcf7),
                Color(0xffFFFFFF),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 200,
                height: 150,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Create An Account',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomInputField(
                              icon: Icons.person,
                              label: 'User Name',
                              validate: (String? value)
                              {
                                if(value!.isEmpty)
                                    {
                                       return'User name is already taken';
                                    }
                              },
                              type: TextInputType.text,
                              Controller: RegisterCubit.get(context).userNameController,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomInputField(
                              icon: Icons.email,
                              label: 'E-mail',
                              validate: (String? value)
                              {
                                if(value!.isEmpty)
                                {
                                  return'Please enter your email address';
                                }
                              },
                              type: TextInputType.emailAddress,
                              Controller: RegisterCubit.get(context).emailController,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomInputField(
                              icon: Icons.phone,
                              label: 'Phone Number',
                              validate: (String? value)
                              {
                                if(value!.isEmpty)
                                {
                                  return'Please enter your phone Number';
                                }
                              },
                              type: TextInputType.phone,
                              Controller: RegisterCubit.get(context).phoneController,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomInputField2(
                              icon: Icons.lock_open_outlined,
                              icon2: RegisterCubit.get(context).suffix,
                              label: 'Password',
                              validate: (String? value)
                              {
                                if(value!.isEmpty)
                                {
                                  return'Password is too short';
                                }
                              },
                              type: TextInputType.visiblePassword,
                              passwordController:RegisterCubit.get(context).passwordController,
                              suffixPressed: ()
                              {
                                RegisterCubit.get(context).changePasswordVisibility();
                              },
                              suffixColor: RegisterCubit.get(context).isPassword ? Colors.grey
                                  : CustomColor.blue11,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context) => MainButton(
                                width: 290,
                                onTap: ()
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    RegisterCubit.get(context).userRegister(
                                        email:RegisterCubit.get(context).emailController.text ,
                                        password: RegisterCubit.get(context).passwordController.text,
                                        //phoneNumber: RegisterCubit.get(context).phoneController.text,
                                        userName: RegisterCubit.get(context).userNameController.text,
                                    );
                                  }
                                },
                                label: 'Sign Up',
                              ),
                              fallback: (context) => CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

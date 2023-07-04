import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/constants/constants.dart';
import 'package:project/modules/access_screen/access_screen.dart';
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
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(showCustomSnackBar('Register Succes', false));
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const AccessScreen()),
                (route) => false);
          }
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(showCustomSnackBar(state.error, true));
          }
        },
        builder: (context, state) {
          var c = RegisterCubit.get(context);
          return Container(
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
                  height: 115.0,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      c.getImage(context);
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 125.0,
                          height: 125.0,
                          child: c.userImageUrl == null
                                  ? const CircleAvatar(
                                      //backgroundColor: Colors.grey.shade200,
                                      radius: 50.0,
                                      child: Text(
                                        'Upload your \n child photo',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              c.userImageUrl!),
                                        ),
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white),
                                          //the outline color
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              70.0,
                                            ),
                                          ),
                                        ),
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
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                              const SizedBox(
                                height: 40.0,
                              ),
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomInputField(
                                icon: Icons.person,
                                label: 'User Name',
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'User name is already taken';
                                  }
                                },
                                type: TextInputType.text,
                                Controller: RegisterCubit.get(context)
                                    .userNameController,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomInputField(
                                icon: Icons.email,
                                label: 'E-mail',
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                },
                                type: TextInputType.emailAddress,
                                Controller:
                                    RegisterCubit.get(context).emailController,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomInputField(
                                icon: Icons.phone,
                                label: 'Phone Number',
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone Number';
                                  }
                                },
                                type: TextInputType.phone,
                                Controller:
                                    RegisterCubit.get(context).phoneController,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomInputField2(
                                icon: Icons.lock_open_outlined,
                                icon2: RegisterCubit.get(context).suffix,
                                label: 'Password',
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Password is too short';
                                  }
                                },
                                type: TextInputType.visiblePassword,
                                passwordController: RegisterCubit.get(context)
                                    .passwordController,
                                suffixPressed: () {
                                  RegisterCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                suffixColor:
                                    RegisterCubit.get(context).isPassword
                                        ? Colors.grey
                                        : CustomColor.blue11,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ConditionalBuilder(
                                condition: state is! RegisterLoadingState,
                                builder: (context) => MainButton(
                                  width: 290,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      RegisterCubit.get(context).userRegister(
                                        context,
                                      );
                                    }
                                  },
                                  label: 'Sign Up',
                                ),
                                fallback: (context) =>
                                    CircularProgressIndicator(),
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
          );
        },
      ),
    );
  }
}

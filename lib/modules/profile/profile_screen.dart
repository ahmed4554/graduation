import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/cache_helper.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/register_screen/cubit/states.dart';

import '../register_screen/cubit/cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  //String? userName,email,password,phoneNumber;


  @override
  void initState() {
    //userName = CacheHelper.getData(key: 'userName');
    //email = CacheHelper.getData(key: 'email');
    //password = CacheHelper.getData(key: 'password');
    //phoneNumber = CacheHelper.getData(key: 'phone_number');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
        builder: (BuildContext context, state) {
          var c = RegisterCubit.get(context);
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    CustomColor.blue11,
                    Color(0xffccdfef),
                    Color(0xffccdfef),
                  ],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          size: 27.0,
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
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: InkWell(
                              onTap: ()
                              {
                                c.getImage(context);
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 125.0,
                                    height: 125.0,
                                    child: c.image == null ? CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      radius: 50.0,
                                      child: Text(
                                              'Upload your \n child photo',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                    )
                                  : Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: FileImage(
                                            c.image!
                                          )
                                        ),
                                        shape:  RoundedRectangleBorder(
                                            side:new  BorderSide(color: Colors.white), //the outline color
                                            borderRadius: new BorderRadius.all(new Radius.circular(70.0))),
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
                                            color: Colors.white,
                                          width: 3
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
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
                            height: 20.0,
                          ),
                         // if (userName != null)
                            Center(
                              child: Container(
                                padding: EdgeInsets.all(.8),
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: Offset.zero,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: Text(
                                    //userName!,
                                    '',
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            'Email :',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(.6)),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            width: 350.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset.zero,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: Colors.black.withOpacity(.6),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                   // email!,
                                    '',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(.6)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Password :',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(.6)),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            width: 350.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset.zero,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock_open_outlined,
                                    color: Colors.black.withOpacity(.6),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                   // password!,
                                    '',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(.6)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Phone Number :',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(.6)),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            width: 350.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset.zero,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.black.withOpacity(.6),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    //phoneNumber!,
                                    '',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(.6)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, state) {});
  }
}

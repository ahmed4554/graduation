import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/constants/constants.dart';
import 'package:project/modules/about_us/about_us.dart';
import 'package:project/modules/child_app/home_Screen/home_screen.dart';
import 'package:project/modules/register_screen/cubit/states.dart';

import '../register_screen/cubit/cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userName, email, password, phoneNumber;

  @override
  void initState() {
    // getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      builder: (BuildContext context, state) {
        var c = RegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColor.blue11.withOpacity(.8),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            title: Text(
              'Profile',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontSize: 24.0),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
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
                                      child: model == null
                                          ? const CircularProgressIndicator()
                                          : model!.image == null
                                              ? const CircleAvatar(
                                                  //backgroundColor: Colors.grey.shade200,
                                                  radius: 50.0,
                                                  child: Text(
                                                    'Upload your \n child photo',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              : Container(
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      image:
                                                          CachedNetworkImageProvider(
                                                              model!.image!),
                                                    ),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.white),
                                                      //the outline color
                                                      borderRadius:
                                                          BorderRadius.all(
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
                                          border: Border.all(
                                              color: Colors.white, width: 3),
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
                            if (userName != null)
                              Center(
                                child: Center(
                                  child: Text(
                                    userName!.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(
                              height: 40.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ChildHomeScreen()));
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 42.0,
                                      height: 42.31,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.blue.shade300,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    const Text(
                                      'Child Section',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 30.0,
                                  child: Divider(
                                    color: Colors.grey.shade200.withOpacity(.5),
                                    thickness: 3.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return const AboutUsScreen();
                                    }),
                                  );
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 42.0,
                                      height: 42.31,
                                      child: Image.asset(
                                        'assets/images/settings/about.png',
                                        color: Colors.green.shade300,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    const Text(
                                      'About Us',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 30.0,
                                  child: Divider(
                                    color: Colors.grey.shade200.withOpacity(.5),
                                    thickness: 3.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 42.0,
                                      height: 42.31,
                                      child: Image.asset(
                                        'assets/images/settings/help.png',
                                        color: Colors.deepOrangeAccent.shade200,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    const Text(
                                      'Help Centre',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 30.0,
                                  child: Divider(
                                    color: Colors.grey.shade200.withOpacity(.5),
                                    thickness: 3.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 42.0,
                                      height: 42.31,
                                      child: Image.asset(
                                        'assets/images/settings/friend.png',
                                        color: Colors.deepPurple.shade300,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    const Text(
                                      'Invite Friends',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 30.0,
                                  child: Divider(
                                    color: Colors.grey.shade200.withOpacity(.5),
                                    thickness: 3.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  c.logOut(context);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 42.0,
                                      height: 42.31,
                                      child: Image.asset(
                                        'assets/images/settings/logout.png',
                                        color: Colors.red.shade700,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    const Text(
                                      'LogOut',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 105.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}

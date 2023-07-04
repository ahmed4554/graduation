import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/reminder_history/reminder_history.dart';
import 'package:project/utils/reminder_cubit/reminder_cubit.dart';
import 'package:project/utils/reminder_cubit/reminder_states.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blueAccent,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Add Event To Patient History',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      body: BlocConsumer<ReminderCubit, ReminderStates>(
        listener: (context, state) {
          if (state is SetPrescriptionDataSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const PrescriptionHistory()),
                (route) => false);
          }
        },
        builder: (context, state) {
          var c = ReminderCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                if (c.prescriptionImage != null)
                  Image(
                    image: FileImage(c.prescriptionImage!),
                    width: 150,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                if (c.prescriptionImage == null)
                  Center(
                    child: InkWell(
                      onTap: () {
                        ReminderCubit.get(context).takePhoto().then((value) {
                          ReminderCubit.get(context)
                              .uploudPrescriptionPhoto(context);
                          showBottomSheet(
                            constraints:
                                BoxConstraints.tight(Size(width, height * .35)),
                            backgroundColor: Colors.transparent,
                            enableDrag: true,
                            context: context,
                            builder: (context) => ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: BottomSheet(
                                  backgroundColor: Colors.red.withOpacity(.3),
                                  onClosing: () {},
                                  builder: (context) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Enter The prescription Data',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        TextFormField(
                                          controller: ReminderCubit.get(context)
                                              .titleController,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Enter The title of the Prescription',
                                            fillColor:
                                                Colors.white.withOpacity(.5),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: ReminderCubit.get(context)
                                              .descController,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Enter The description of the Prescription',
                                            fillColor:
                                                Colors.white.withOpacity(.5),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          onPressed: () {
                                            c.setPrescriptionData(context);
                                          },
                                          child: const Text(
                                              'add this prescription'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 125.0,
                            height: 125.0,
                            child: c.prescriptionImage == null
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
                                    width: 150,
                                    height: 300,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: FileImage(
                                          c.prescriptionImage!,
                                        ),
                                        fit: BoxFit.contain,
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
                                border:
                                    Border.all(color: Colors.white, width: 3),
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
                PrescriptionDataInner(
                  title: 'Date',
                  desc: DateTime.now().toString().substring(0, 10),
                ),
                const SizedBox(
                  height: 15,
                ),
                PrescriptionDataInner(
                  title: 'Specialist',
                  desc: c.titleController.text.isEmpty
                      ? 'click the camera Icon to add information'
                      : c.titleController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                PrescriptionDataInner(
                  title: 'Description',
                  desc: c.descController.text.isEmpty
                      ? 'click the camera Icon to add information'
                      : c.descController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PrescriptionDataInner extends StatelessWidget {
  const PrescriptionDataInner({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);
  final String title, desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset.zero,
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          child: Text(
            desc,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

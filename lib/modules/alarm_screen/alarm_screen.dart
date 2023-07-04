import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/utils/cubits/data_cubit/data_cubit.dart';
import 'package:project/utils/cubits/data_cubit/data_states.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 50.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
               Row(
                children: [
                  Icon(
                    Icons.access_alarms_rounded,
                    size: 27.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Alarm',
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 100.0,
              ),
              Container(
                width: 340.0,
                height: 504.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: const LinearGradient(
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
                  padding: const EdgeInsets.all(26.0),
                  child: BlocConsumer<DataCubit, DataStates>(
                    builder: (context, state) {
                      var c = DataCubit.get(context);
                      return Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Create an event',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.notifications_active,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: c.controller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'You must enter event address';
                                }
                              },
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintText: 'Enter event address',
                                hintStyle: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                            const Text(
                              'Date & Time',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            InkWell(
                              onTap: () async {
                                c.date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 55.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  c.alarmDate == null
                                      ? c.dateString
                                      : '${c.alarmDate!.year}-${c.alarmDate!.month}-${c.alarmDate!.day}',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            InkWell(
                              onTap: () async {
                                await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  c.alarmDate = DateTime(
                                    c.date!.year,
                                    c.date!.month,
                                    c.date!.day,
                                    value!.hour,
                                    value.minute,
                                  );
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 55.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  c.alarmDate == null
                                      ? c.dateString
                                      : '${c.alarmDate!.hour}:${c.alarmDate!.minute}',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                SizedBox(
                                  width: 105.0,
                                  height: 40.0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        c.setAlarm();
                                      }
                                    },
                                    child: const Text(
                                      'Create',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19.0),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomColor.blue11,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 105.0,
                                  height: 40.0,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await Alarm.stop(0);
                                    },
                                    child: const Text(
                                      'Stop',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19.0),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomColor.blue11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    listener: (context, state) {},
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

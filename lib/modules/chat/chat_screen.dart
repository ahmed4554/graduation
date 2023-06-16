import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/components.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/models/message_model/messages_model.dart';
import 'package:project/utils/cubits/data_cubit/data_cubit.dart';
import 'package:project/utils/cubits/data_cubit/data_states.dart';

class ChatGroup extends StatefulWidget {
  const ChatGroup({Key? key}) : super(key: key);

  @override
  State<ChatGroup> createState() => _ChatGroupState();
}

class _ChatGroupState extends State<ChatGroup> {
  String currentGroup = 'Momys';
  List<String> groups = [
    'Momys',
    'Share Experiece',
    'Emergency',
    'FAQ',
  ];
  List<String> groupIcons = [
    'assets/images/groups_icons/mothers.png',
    'assets/images/groups_icons/share_ex.jpg',
    'assets/images/groups_icons/emergency.jpg',
    'assets/images/groups_icons/faq.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: CustomColor.blue11,
        elevation: 0,
        leading: Image.asset(
          'assets/images/logo.png',
          width: 65,
          height: 65,
        ),
        title: Text(
          currentGroup,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColor.blue11,
              Color(0xffc6dff1),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<DataCubit, DataStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var c = DataCubit.get(context);
              return Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.7),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                children: List.generate(
                                  4,
                                      (index) => InkWell(
                                    onTap: () {
                                      currentGroup = groups[index];
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                        AssetImage(groupIcons[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: height - 180,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero,
                                ),
                                color: Colors.white,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: StreamBuilder<
                                          QuerySnapshot<Map<String, dynamic>>>(
                                        stream: c.chatGroup
                                            .doc(currentGroup)
                                            .collection('messages')
                                            .orderBy(
                                          'date',
                                          descending: false,
                                        )
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return ListView.separated(
                                              itemBuilder: (context, index) {
                                                return snapshot.data!
                                                    .docs[index]
                                                    .data()[
                                                'userName'] ==
                                                    c.userName
                                                    ? UserMessage(
                                                  model: MessagesModel
                                                      .fromJson(
                                                    snapshot
                                                        .data!.docs[index]
                                                        .data(),
                                                  ),
                                                )
                                                    : BotMessage(
                                                  model: MessagesModel
                                                      .fromJson(
                                                    snapshot
                                                        .data!.docs[index]
                                                        .data(),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) =>
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              itemCount:
                                              snapshot.data!.docs.length,
                                            );
                                          } else if (snapshot.hasError) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'error',
                                                ),
                                              ),
                                            );
                                            return const SizedBox.shrink();
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: c.controller,
                                                decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                    onPressed: ()
                                                    {
                                                      c.takePhoto(
                                                        currentGroup:
                                                        currentGroup,
                                                      );
                                                    },
                                                    icon: const Icon(
                                                      Icons.photo_camera,
                                                    ),
                                                  ),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 10),
                                                  hintText: 'Ask Something ...',
                                                  border:
                                                  const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                c.sendMessage(
                                                  kind: 'text',
                                                  currentGroup: currentGroup,
                                                );
                                              },
                                              child: Material(
                                                elevation: 5,
                                                shadowColor: Colors.black45,
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                child: CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    Icons.send,
                                                    color: Colors.blue[300],
                                                  ),
                                                ),
                                              ),
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
                        ],
                      ),
                    ],
                  ),
                  if (c.imageToSendInChat != null)
                    Positioned(
                        bottom: 0 + 85,
                        left: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: FileImage(
                              c.imageToSendInChat!,
                            ),
                            width: 150,
                          ),
                        )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

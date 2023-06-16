import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/components.dart';
import 'package:project/modules/child_app/chat_bot/bot_cubit.dart';
import 'package:project/modules/child_app/chat_bot/bot_cubit_states.dart';

class ChatBot extends StatelessWidget {
  ChatBot({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/child_app/chatBot/coverchat.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: double.maxFinite,
          padding: const EdgeInsets.only(
            top: 45.0,
            left: 10.0,
            right: 10.0,
          ),
          child: BlocConsumer<BotCubit, BotCubitStates>(
            builder: (context, state) {
              var c = BotCubit.get(context);
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/chatbot.png',
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        'Alex ChatBot',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/images/child_app/chatBot/dots.png',
                        width: 20.0,
                        height: 30.0,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    indent: 10.0,
                    endIndent: 10.0,
                    height: 16.0,
                    thickness: 1.4,
                  ),
                  // Expanded(
                  //   child: ListView(
                  //     children: List.generate(
                  //       c.userMsg.length,
                  //       (index) => c.isUser
                  //           ? UserMessage(
                  //               uMsg: c.userMsg[index],
                  //             )
                  //             : BotMessage(
                  //               bMsg: c.botMsg[index],
                  //             ),
                  //
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              prefixIcon: Image.asset(
                                'assets/images/child_app/chatBot/Icon.png',
                                width: 19.0,
                                height: 19.0,
                              ),
                              hintText: '  Ask Something ...',
                              hintStyle: const TextStyle(
                                fontSize: 17.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: c.sendMsgController,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        InkWell(
                          onTap: ()
                          {
                            c.sendMsg();
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.send,
                              color: Colors.blue[300],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              );
            },
            listener: (context, state) {},
          ),
        ),
      ),
    );
  }
}

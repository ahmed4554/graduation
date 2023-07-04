import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project/models/chat_bot_model.dart';
import 'package:project/modules/child_app/chat_bot/bot_cubit_states.dart';

class BotCubit extends Cubit<BotCubitStates> {
  BotCubit() : super(BotInitialState());

  static BotCubit get(context) {
    return BlocProvider.of(context);
  }

  var sendMsgController = TextEditingController();
  bool? isUser;

  Map<String, List> genres = {
    'hi': ['Hi I am Alex how can I help you', 'Hello my friend', 'Welcome sir'],
    'how are you': ['I am fine', 'I am good'],
    'Are you listening?': ['Yes, I am very interested to hear from you'],
    'Do you see me?': ['Yes, you look very beautiful'],
    'What Makes You So Fabulous?': [
      'I\'m fabulous because I\'m confident, unique, and always ready to have a good time!'
    ],
    'How Do Planes Stay In The Air?': [
      'Planes fly because they are lifted by the air around them. The air pushes up'
          'on the plane just like it pushes up on you when you jump in the air.'
    ],
    'How do Animals Communicate ?': [
      'Animals communicate in different ways, depending on the species. For example',
      'dogs communicate by barking, wagging their tails, and making eye contact'
    ],
    'Why do I need to eat vegetables?': ['Vegetables give you energy.'],
    'Why do I have to go to school?': [
      'To help children learn about what they need to do to care for themselves',
      'a home',
      'and a family'
    ],
    'Why is the sky blue?': [
      'The sky is blue because the air scatters blue light from the Sun across the sky and down to our eyes.'
    ],
  };
  List<String> date = [DateTime.now().toString().substring(0, 10)];
  List<ChatBotModel> messages = [];

  void sendMessage() {
    String response = 'Sorry I can\'t understand you';
    if (genres.containsKey(sendMsgController.text)) {
      isUser = true;
      response = genres[sendMsgController.text]![
          Random().nextInt(genres[sendMsgController.text]!.length)];
      messages.add(ChatBotModel(
          leftMessage: response, rightMessage: sendMsgController.text));
      sendMsgController.clear();
      emit(BotSuccessState());
    } else {
      isUser = false;
      messages.add(ChatBotModel(
          leftMessage: response, rightMessage: sendMsgController.text));
          sendMsgController.clear();
      emit(BotErrorState());
    }
  }
}

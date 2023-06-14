import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/dio_helper.dart';
import 'package:project/components/end_points.dart';
import 'package:project/modules/child_app/chat_bot/bot_cubit_states.dart';

class BotCubit extends Cubit<BotCubitStates>{
  BotCubit() : super(BotInitialState());
  
  var sendMsgController = TextEditingController();
  bool isUser = false;
  List<String> userMsg = [];

  List<String> botMsg = [];

  static BotCubit get(context){
    return BlocProvider.of(context);
  }
  
  void sendMsg()async{
    isUser = true;
    userMsg.add(sendMsgController.text);
    emit(BotLoadingState());

    await DioHelper.postData(
        url: bot,
        data:
        {
          "user_input": sendMsgController.text,
        },
    ).then((value) {
      emit(BotSuccessState());
      getMsg();
    }).catchError((e)
    {
      emit(BotErrorState(e.toString()));
      print(e);
    });
    
  }
  
  void getMsg()async{
    isUser = false;
    emit(GetMsgLoadingState());
    
    await DioHelper.getData(
        url: bot ,
        query:
        {
          'user_input': sendMsgController.text,
        },
    ).then((value){
      emit(BotSuccessState());
      botMsg.add(value.data['bot_response']);
      print(value);
    }).catchError((e){
      emit(BotErrorState(e.toString()));
      print(e);
    });
  }
}
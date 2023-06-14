abstract class BotCubitStates{}

class BotInitialState extends BotCubitStates{}

class BotLoadingState extends BotCubitStates{}

class BotSuccessState extends BotCubitStates{}

class BotErrorState extends BotCubitStates{
  final String error;
  BotErrorState(this.error);
}



class GetMsgLoadingState extends BotCubitStates{}

class GetMsgSuccessState extends BotCubitStates{}

class GetMsgErrorState extends BotCubitStates{
  final String error;
  GetMsgErrorState(this.error);
}

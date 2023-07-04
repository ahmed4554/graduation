class ChatBotModel {
  String? rightMessage;
  String? leftMessage;

  ChatBotModel({
    required this.leftMessage,
    required this.rightMessage,
  });
  ChatBotModel.fromJson(Map<String, dynamic> json) {
    leftMessage = json['bot_response'];
    rightMessage = json['user_input'];
  }
}

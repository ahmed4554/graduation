import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
  String? text, kind, pic, userName, senderImage;
  Timestamp? date;

  MessagesModel({
    required this.date,
    required this.kind,
    required this.pic,
    required this.text,
    required this.senderImage,
    required this.userName,
  });

  MessagesModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    kind = json['kind'];
    pic = json['pic'];
    date = json['date'] ?? Timestamp.now();
    userName = json['userName'];
    senderImage = json['senderImage'];
  }

  Map<String, dynamic> toMap() => {
        'text': text,
        'kind': kind,
        'pic': pic,
        'date': date,
        'userName': userName,
        'senderImage': senderImage,
      };
}

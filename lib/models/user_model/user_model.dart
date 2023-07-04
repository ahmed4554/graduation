import 'dart:typed_data';

class UserModel {
  String? email;
  String? userName;
  String? phoneNumber;
  String? image;
  String? id;

  UserModel({
    required this.email,
    this.image,
    required this.id,
    required this.userName,
    required this.phoneNumber,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    image = json['image'];
    id = json['id'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'email': email,
        'userName': userName,
        'phoneNumber': phoneNumber,
      };
}

// class Blood {
//   List<Info> info = [];

//   Blood.fromList(List<dynamic> list) {
//     for (var i in list) {
//       info.add(Info.fromJson(i));
//     }
//   }
// }

// class Info {
//   String? donor_name, bloodType;
//   String? long, lat;
//   String? phone_number;

//   Info.fromJson(Map<dynamic, dynamic> json) {
//     bloodType = json['blood_type'];
//     donor_name = json['donor_name'];
//     phone_number = json['phone_number'];
//     lat = json['lat'];
//     long = json['long'];
//   }
// }
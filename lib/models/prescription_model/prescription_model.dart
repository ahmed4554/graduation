class PrescriptionModel {
  String? title, desc, date, image;

  PrescriptionModel({
    required this.date,
    required this.desc,
    required this.title,
    required this.image,
  });

  PrescriptionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    date = json['date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'desc': desc,
        'date': date,
        'image':image,
      };
}

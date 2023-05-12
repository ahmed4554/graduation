/// questions : [{"text":"How many ants are there ?","text2":"","kind":"text","pic":"assets/Database/animals/images/Ant.png","answer":"1","options":["3","1","5"]},{"text":"Which one of these represents 7 triangles","text2":"","answer":"assets/D21/images/images_pictures/7/right.png","kind":"pic","pic":"","options":["assets/D21/images/images_pictures/7/right.png","assets/D21/images/images_pictures/7/wrong.png"]},{"text":"How many dots are on the frame ?","text2":"","kind":"text","pic":"assets/D21/images/images_pictures/dots/dots.png","answer":"6","options":["3","6","5",null]},{"text":"How do you write {Eight} by digit ?","text2":"","answer":"8","kind":"text","pic":"","options":["3","6","8",null]},{"text":"How many watermelons are there ?","text2":"","pic":"assets/D21/images/images_fruits/apple.png","answer":"3","kind":"text","options":["3","1","5",null]},{"text":"Which number is larger ?","text2":"","answer":"7","pic":"","kind":"text","options":["5","7"]},{"kind":"text","text2":"","text":"Which number is smaller ?","answer":"0","pic":"","options":["0","8"]},{"kind":"pic","text2":"","text":"Which one of these is more ?","answer":"assets/D21/images/images_pictures/7/right.png","pic":"","options":["assets/D21/images/images_pictures/7/right.png","assets/D21/images/images_pictures/7/wrong.png"]},{"kind":"text","text2":"","text":"Count the tally marks. What number is shown?","pic":"assets/D21/images/images_pictures/tally/tally.png","answer":"5","options":["3","1","5",null]},{"kind":"text","text2":"","text":"How many cubes are there ?","pic":"assets/D21/images/images_pictures/cubes/cubes.png","answer":"6","options":["3","6","5",null]}]

class QNumbers {
  QNumbers({
      this.questions,});

  QNumbers.fromJson(dynamic json) {
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  List<Questions>? questions;
QNumbers copyWith({  List<Questions>? questions,
}) => QNumbers(  questions: questions ?? this.questions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// text : "How many ants are there ?"
/// text2 : ""
/// kind : "text"
/// pic : "assets/Database/animals/images/Ant.png"
/// answer : "1"
/// options : ["3","1","5"]

class Questions {
  Questions({
      this.text, 
      this.text2, 
      this.kind, 
      this.pic, 
      this.answer, 
      this.options,});

  Questions.fromJson(dynamic json) {
    text = json['text'];
    text2 = json['text2'];
    kind = json['kind'];
    pic = json['pic'];
    answer = json['answer'];
    options = json['options'] != null ? json['options'].cast<String>() : [];
  }
  String? text;
  String? text2;
  String? kind;
  String? pic;
  String? answer;
  List<String>? options;
Questions copyWith({  String? text,
  String? text2,
  String? kind,
  String? pic,
  String? answer,
  List<String>? options,
}) => Questions(  text: text ?? this.text,
  text2: text2 ?? this.text2,
  kind: kind ?? this.kind,
  pic: pic ?? this.pic,
  answer: answer ?? this.answer,
  options: options ?? this.options,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['text2'] = text2;
    map['kind'] = kind;
    map['pic'] = pic;
    map['answer'] = answer;
    map['options'] = options;
    return map;
  }

}
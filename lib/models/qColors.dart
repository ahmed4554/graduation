/// questions : [{"kind":"text","text":"What is the color?","text2":"","pic":"assets/Database/colors/color/BLUE.png","answer":"Blue","options":["Orange","Blue","Green"]},{"kind":"text","text":"What is the color?","text2":"","pic":"assets/Database/colors/color/PINK.png","answer":"Pink","options":["Pink","Purple","Brown"]},{"kind":"text","text":"What is the color?","text2":"","pic":"assets/Database/colors/color/YELLOW.png","answer":"Yellow","options":["Green","Red","Yellow"]},{"kind":"text","text":"What is the color of the hat ","text2":"","pic":"assets/Database/colors/hat.png","answer":"Green","options":["Green","Blue","White"]},{"kind":"text","text":"What is the color of the shoes?","text2":"","pic":"assets/Database/colors/shoes.png","answer":"Blue","options":["Red","Pink","Blue"]},{"kind":"text","text":"What is the color of the ball?","text2":"","pic":"assets/Database/colors/ball.png","answer":"Orange","options":["Yellow","Orange","Black"]},{"kind":"text","text":"What is the color the shorts?","text2":"","pic":"assets/Database/colors/brown.png","answer":"Brown","options":["Brown","Red","Blue"]},{"kind":"text","text":"What is the color of the car?","text2":"","pic":"assets/Database/colors/car.png","answer":"Red","options":["Pink","Purple","Red"]},{"kind":"text","text":"What is the color of the fruit in the picture?","text2":"","pic":"assets/Database/colors/grapes.png","answer":"Purple","options":["Blue","Purple","White"]},{"kind":"text","text":"What is the color of the flower?","text2":"","pic":"assets/Database/colors/sun.png","answer":"Yellow","options":["Orange","Black","Yellow"]},null]

class QColors {
  QColors({
      this.questions,});

  QColors.fromJson(dynamic json) {
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  List<Questions>? questions;
QColors copyWith({  List<Questions>? questions,
}) => QColors(  questions: questions ?? this.questions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// kind : "text"
/// text : "What is the color?"
/// text2 : ""
/// pic : "assets/Database/colors/color/BLUE.png"
/// answer : "Blue"
/// options : ["Orange","Blue","Green"]

class Questions {
  Questions({
      this.kind, 
      this.text, 
      this.text2, 
      this.pic, 
      this.answer, 
      this.options,});

  Questions.fromJson(dynamic json) {
    kind = json['kind'];
    text = json['text'];
    text2 = json['text2'];
    pic = json['pic'];
    answer = json['answer'];
    options = json['options'] != null ? json['options'].cast<String>() : [];
  }
  String? kind;
  String? text;
  String? text2;
  String? pic;
  String? answer;
  List<String>? options;
Questions copyWith({  String? kind,
  String? text,
  String? text2,
  String? pic,
  String? answer,
  List<String>? options,
}) => Questions(  kind: kind ?? this.kind,
  text: text ?? this.text,
  text2: text2 ?? this.text2,
  pic: pic ?? this.pic,
  answer: answer ?? this.answer,
  options: options ?? this.options,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['text'] = text;
    map['text2'] = text2;
    map['pic'] = pic;
    map['answer'] = answer;
    map['options'] = options;
    return map;
  }

}
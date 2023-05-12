/// questions : [{"kind":"text","text":"Can you name this fruit ?","text2":"","pic":"assets/Database/fruits/fruits/peach.png","answer":"Peach","options":["Strawberry","Mango","Peach"]},{"kind":"text","text":"Can you name this fruit ?","text2":"","pic":"assets/Database/fruits/fruits/banana.png","answer":"Banana","options":["Banana","Lemon","Cucumber"]},{"kind":"text","text":"Can you name this fruit ?","text2":"","pic":"assets/Database/fruits/fruits/mango.png","answer":"Mango","options":["Fig","Mango","Orange"]},{"kind":"text","text":"Can you name this fruit ?","text2":"","pic":"assets/Database/fruits/fruits/watermelon.png","answer":"Watermelon","options":["Orange","Watermelon","Dragon"]},{"kind":"text","text":"Are these grapes?","text2":"","pic":"assets/Database/fruits/fruits/graps.png","answer":"Yes,they are.","options":["No,they are not","No,it's not","Yes,they are."]},{"kind":"text","text":"Is this a jackfruit?","text2":"","pic":"assets/Database/fruits/fruits/sweet potato.png","answer":"No,it's not","options":["No,it's not","Yes,it is"]},{"kind":"text","text":"What color is the apple?","text2":"","pic":"assets/Database/fruits/fruits/apple.png","answer":"Red","options":["Yellow","Blue","Red"]},{"kind":"text","text":"What is this?","text2":"","pic":"assets/Database/fruits/fruits/str.png","answer":"Strawberry","options":["Apple","Strawberry","Lemon"]},{"kind":"pic","text":"","text2":"","pic":"assets/Database/fruits/fruits/kiwi.png","answer":"","options":["assets/Database/fruits/fruits/tangerine.png","assets/Database/fruits/fruits/quince.png","assets/Database/fruits/fruits/kiwi.png",null]},{"kind":"pic","text":"Which one of these is cherries?","text2":"","pic":"","answer":"assets/Database/fruits/fruits/cherries.png","options":["assets/Database/fruits/fruits/graps.png","assets/Database/fruits/fruits/cherries.png","assets/Database/fruits/fruits/quince.png",null]},null]

class QFruits {
  QFruits({
      this.questions,});

  QFruits.fromJson(dynamic json) {
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  List<Questions>? questions;
QFruits copyWith({  List<Questions>? questions,
}) => QFruits(  questions: questions ?? this.questions,
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
/// text : "Can you name this fruit ?"
/// text2 : ""
/// pic : "assets/Database/fruits/fruits/peach.png"
/// answer : "Peach"
/// options : ["Strawberry","Mango","Peach"]

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
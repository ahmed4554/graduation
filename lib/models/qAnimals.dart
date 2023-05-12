/// questions : [{"kind":"text","text":"What is the name of this animal?","text2":"","pic":"assets/Database/animals/images/Elephant.png","answer":"Elephant","options":["Lion","Donkey","Elephant"]},{"kind":"text","text":"What is the name of this animal?","text2":"","pic":"assets/Database/animals/images/Tiger.png","answer":"Tiger","options":["Tiger","Lion","Kangaroo"]},{"kind":"text","text":"What is the name of this animal?","text2":"","pic":"assets/Database/animals/images/Horse.png","answer":"Horse","options":["Donkey","Horse","Zebra"]},{"kind":"text","text":"What is the name of this aniaml?","text2":"","pic":"assets/Database/animals/images/Fox.png","answer":"Fox","options":["Ox","Fox","Box"]},{"kind":"text","text":"What is the name of this animal?","text2":"","pic":"assets/Database/animals/images/Monkey.png","answer":"Monkey","options":["Numba","Yak","Monkey"]},{"kind":"text","text":"What is the name of this bird?","text2":"","pic":"assets/Database/animals/images/Penguin.png","answer":"Penguin","options":["Sheep","Tiger","Penguin"]},{"kind":"text","text":"What is the name of this bird?","text2":"","pic":"assets/Database/animals/images/Vulture.png","answer":"Vulture","options":["Vulture","Iguana","Rooster"]},{"kind":"text","text":"What is the name of this fish?","text2":"","pic":"assets/Database/animals/images/Whale.png","answer":"Whale","options":["Jellyfish","Whale","Unicorn"]},{"kind":"text","text":"What is the name of this animal?","text2":"","pic":"assets/Database/animals/images/Sheep.png","answer":"Sheep","options":["Numba","Duck","Sheep"]},{"kind":"text","text":"What is the name of this animal?","text2":"","pic":"assets/Database/animals/images/Dog.png","answer":"Dog","options":["Dog","Cat","Donkey"]},null]

class QAnimals {
  QAnimals({
      this.questions,});

  QAnimals.fromJson(dynamic json) {
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  List<Questions>? questions;
QAnimals copyWith({  List<Questions>? questions,
}) => QAnimals(  questions: questions ?? this.questions,
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
/// text : "What is the name of this animal?"
/// text2 : ""
/// pic : "assets/Database/animals/images/Elephant.png"
/// answer : "Elephant"
/// options : ["Lion","Donkey","Elephant"]

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
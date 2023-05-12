/// questions : [{"kind":"pic","text":"What is this shape?","text2":"","pic":"assets/Database/shapes/shapes/circle.png","answer":"circle","options":["square","circle","kite"]},{"kind":"pic","text":"What is this shape?","text2":"","pic":"assets/Database/shapes/shapes/octagon.png","answer":"octagon","options":["octagon","star","heart"]},{"kind":"pic","text":"What is this shape?","text2":"","pic":"assets/Database/shapes/shapes/triangle.png","answer":"triangle","options":["heptagon","circle","triangle"]},{"kind":"pic","text":"How many sides does a triangle have?","text2":"","pic":"assets/Database/shapes/shapes/triangle.png","answer":"3","options":["3","4","5"]},{"kind":"pic","text":"How many sides does a pentagon have?","text2":"","pic":"assets/Database/shapes/shapes/pentagon.png","answer":"5","options":["4","6","5"]},{"kind":"pic","text":"How many angles does a square have?","text2":"","pic":"assets/Database/shapes/shapes/square.png","answer":"4","options":["5","4","3"]},{"kind":"pic","text":"How many angles does a trapezoid have?","text2":"","pic":"assets/Database/shapes/shapes/trapezoid.png","answer":"4","options":["3","5","4"]},{"kind":"pic","text":"Which statement is true about the sides of a rectangle?","text2":"","pic":"assets/Database/shapes/shapes/rectangle.png","answer":"Two sides are short, two sides are long","options":["They are all the same length","Two sides are short, two sides are long","Two sides are curved, two are short"]},{"kind":"pic","text":"How many angles does a rectangle have?","text2":"","pic":"assets/Database/shapes/shapes/heptagon.png","answer":"7","options":["5","4","7","6"]},{"kind":"text","text":"how many sides does a square have?","text2":"","pic":"assets/Database/shapes/shapes/square.png","answer":"4","options":["3","4","5","6"]},null]

class QShapes {
  QShapes({
      this.questions,});

  QShapes.fromJson(dynamic json) {
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  List<Questions>? questions;
QShapes copyWith({  List<Questions>? questions,
}) => QShapes(  questions: questions ?? this.questions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// kind : "pic"
/// text : "What is this shape?"
/// text2 : ""
/// pic : "assets/Database/shapes/shapes/circle.png"
/// answer : "circle"
/// options : ["square","circle","kite"]

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
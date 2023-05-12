/// questions : [{"kind":"text","text":"Pick the lowercase letter that matches ?","pic":"","answer":"s","options":["x","p","s"]}]

class QAlpha {
  QAlpha({
      this.questions,});

  QAlpha.fromJson(dynamic json) {
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  List<Questions>? questions;
QAlpha copyWith({  List<Questions>? questions,
}) => QAlpha(  questions: questions ?? this.questions,
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
/// text : "Pick the lowercase letter that matches ?"
/// pic : ""
/// answer : "s"
/// options : ["x","p","s"]

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
}) => Questions(
  kind: kind ?? this.kind,
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
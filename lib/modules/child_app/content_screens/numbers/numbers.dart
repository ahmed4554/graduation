/// activity : "numbers"
/// names : ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine"]
/// number : ["0","1","2","3","4","5","6","7","8","9"]
/// shapes : ["assets/Database/numbers/shapes/0.png","assets/Database/numbers/shapes/1.png","assets/Database/numbers/shapes/2.png","assets/Database/numbers/shapes/3.png","assets/Database/numbers/shapes/4.png","assets/Database/numbers/shapes/5.png","assets/Database/numbers/shapes/6.png","assets/Database/numbers/shapes/7.png","assets/Database/numbers/shapes/8.png","assets/Database/numbers/shapes/9.png",null]
/// sounds : ["assets/Database/numbers/sounds/0.mp3","assets/Database/numbers/sounds/1.mp3","assets/Database/numbers/sounds/2.mp3","assets/Database/numbers/sounds/3.mp3","assets/Database/numbers/sounds/4.mp3","assets/Database/numbers/sounds/5.mp3","assets/Database/numbers/sounds/6.mp3","assets/Database/numbers/sounds/7.mp3","assets/Database/numbers/sounds/8.mp3","assets/Database/numbers/sounds/9.mp3"]
/// questions : ["What is the number?"]

class Numbers {
  Numbers({
      this.activity, 
      this.names, 
      this.number, 
      this.shapes, 
      this.sounds, 
      this.questions,});

  Numbers.fromJson(dynamic json) {
    activity = json['activity'];
    names = json['names'] != null ? json['names'].cast<String>() : [];
    number = json['number'] != null ? json['number'].cast<String>() : [];
    shapes = json['shapes'] != null ? json['shapes'].cast<String>() : [];
    sounds = json['sounds'] != null ? json['sounds'].cast<String>() : [];
    questions = json['questions'] != null ? json['questions'].cast<String>() : [];
  }
  String? activity;
  List<String>? names;
  List<String>? number;
  List<String>? shapes;
  List<String>? sounds;
  List<String>? questions;
Numbers copyWith({  String? activity,
  List<String>? names,
  List<String>? number,
  List<String>? shapes,
  List<String>? sounds,
  List<String>? questions,
}) => Numbers(  activity: activity ?? this.activity,
  names: names ?? this.names,
  number: number ?? this.number,
  shapes: shapes ?? this.shapes,
  sounds: sounds ?? this.sounds,
  questions: questions ?? this.questions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['names'] = names;
    map['number'] = number;
    map['shapes'] = shapes;
    map['sounds'] = sounds;
    map['questions'] = questions;
    return map;
  }

}
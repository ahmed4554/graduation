/// activity : "shapes"
/// names : ["circle","heart","heptagon","hexagon","kite","octagon","pentagon","rectangle","square","star","trapezoid","triangle"]
/// pictures : ["assets/Database/shapes/names/circle.png","assets/Database/shapes/names/heart.png","assets/Database/shapes/names/heptagon.png","assets/Database/shapes/names/hexagon.png","assets/Database/shapes/names/kite.png","assets/Database/shapes/names/octagon.png","assets/Database/shapes/names/pentagon.png","assets/Database/shapes/names/rectangle.png","assets/Database/shapes/names/square.png","assets/Database/shapes/names/star.png","assets/Database/shapes/names/trapezoid.png","assets/Database/shapes/names/triangle.png"]
/// shapes : ["assets/Database/shapes/shapes/circle.png","assets/Database/shapes/shapes/heart.png","assets/Database/shapes/shapes/heptagon.png","assets/Database/shapes/shapes/hexagon.png","assets/Database/shapes/shapes/kite.png","assets/Database/shapes/shapes/octagon.png","assets/Database/shapes/shapes/pentagon.png","assets/Database/shapes/shapes/rectangle.png","assets/Database/shapes/shapes/square.png","assets/Database/shapes/shapes/star.png","assets/Database/shapes/shapes/trapezoid.png","assets/Database/shapes/shapes/triangle.png"]
/// sounds : ["assets/Database/shapes/sounds/circle.mp3","assets/Database/shapes/sounds/heart.mp3","assets/Database/shapes/sounds/heptagon.mp3","assets/Database/shapes/sounds/hexagon.mp3","assets/Database/shapes/sounds/kite.mp3","assets/Database/shapes/sounds/octagon.mp3","assets/Database/shapes/sounds/pentagon.mp3","assets/Database/shapes/sounds/rectangle.mp3","assets/Database/shapes/sounds/square.mp3","assets/Database/shapes/sounds/star.mp3","assets/Database/shapes/sounds/trapezoid.mp3","assets/Database/shapes/sounds/triangle.mp3"]
/// questions : ["What is the name of this shape?"]

class Shapes {
  Shapes({
      this.activity, 
      this.names, 
      this.shapes,
      this.sounds, 
      this.questions,});

  Shapes.fromJson(dynamic json) {
    activity = json['activity'];
    names = json['names'] != null ? json['names'].cast<String>() : [];
    shapes = json['shapes'] != null ? json['shapes'].cast<String>() : [];
    sounds = json['sounds'] != null ? json['sounds'].cast<String>() : [];
    questions = json['questions'] != null ? json['questions'].cast<String>() : [];
  }
  String? activity;
  List<String>? names;
  List<String>? shapes;
  List<String>? sounds;
  List<String>? questions;
Shapes copyWith({  String? activity,
  List<String>? names,
  List<String>? shapes,
  List<String>? sounds,
  List<String>? questions,
}) => Shapes(  activity: activity ?? this.activity,
  names: names ?? this.names,
  shapes: shapes ?? this.shapes,
  sounds: sounds ?? this.sounds,
  questions: questions ?? this.questions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['names'] = names;
    map['shapes'] = shapes;
    map['sounds'] = sounds;
    map['questions'] = questions;
    return map;
  }

}
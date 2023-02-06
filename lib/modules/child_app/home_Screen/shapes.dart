/// activity : "shapes"
/// names : ["circle","heart","heptagon","hexagon","kite","octagon","pentagon","rectangle","square","star","trapezoid","triangle"]
/// pictures : ["Database/shapes/names/circle.png","Database/shapes/names/heart.png","Database/shapes/names/heptagon.png","Database/shapes/names/hexagon.png","Database/shapes/names/kite.png","Database/shapes/names/octagon.png","Database/shapes/names/pentagon.png","Database/shapes/names/rectangle.png","Database/shapes/names/square.png","Database/shapes/names/star.png","Database/shapes/names/trapezoid.png","Database/shapes/names/triangle.png"]
/// shapes : ["Database/shapes/shapes/circle.png","Database/shapes/shapes/heart.png","Database/shapes/shapes/heptagon.png","Database/shapes/shapes/hexagon.png","Database/shapes/shapes/kite.png","Database/shapes/shapes/octagon.png","Database/shapes/shapes/pentagon.png","Database/shapes/shapes/rectangle.png","Database/shapes/shapes/square.png","Database/shapes/shapes/star.png","Database/shapes/shapes/trapezoid.png","Database/shapes/shapes/triangle.png"]
/// sounds : ["Database/shapes/sounds/circle.mp3","Database/shapes/sounds/heart.mp3","Database/shapes/sounds/heptagon.mp3","Database/shapes/sounds/hexagon.mp3","Database/shapes/sounds/kite.mp3","Database/shapes/sounds/octagon.mp3","Database/shapes/sounds/pentagon.mp3","Database/shapes/sounds/rectangle.mp3","Database/shapes/sounds/square.mp3","Database/shapes/sounds/star.mp3","Database/shapes/sounds/trapezoid.mp3","Database/shapes/sounds/triangle.mp3"]
/// questions : ["What is the name of this shape"]

class Shapes {
  Shapes({
      this.activity, 
      this.names, 
      this.pictures, 
      this.shapes, 
      this.sounds, 
      this.questions,
  });

  Shapes.fromJson(dynamic json) {
    activity = json['activity'];
    names = json['names'] != null ? json['names'].cast<String>() : [];
    pictures = json['pictures'] != null ? json['pictures'].cast<String>() : [];
    shapes = json['shapes'] != null ? json['shapes'].cast<String>() : [];
    sounds = json['sounds'] != null ? json['sounds'].cast<String>() : [];
    questions = json['questions'] != null ? json['questions'].cast<String>() : [];
  }
  String? activity;
  List<String>? names;
  List<String>? pictures;
  List<String>? shapes;
  List<String>? sounds;
  List<String>? questions;
Shapes copyWith({  String? activity,
  List<String>? names,
  List<String>? pictures,
  List<String>? shapes,
  List<String>? sounds,
  List<String>? questions,
}) => Shapes(  activity: activity ?? this.activity,
  names: names ?? this.names,
  pictures: pictures ?? this.pictures,
  shapes: shapes ?? this.shapes,
  sounds: sounds ?? this.sounds,
  questions: questions ?? this.questions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['names'] = names;
    map['pictures'] = pictures;
    map['shapes'] = shapes;
    map['sounds'] = sounds;
    map['questions'] = questions;
    return map;
  }

}
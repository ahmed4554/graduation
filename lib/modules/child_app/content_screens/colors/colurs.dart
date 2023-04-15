/// activity : "Colors"
/// names : ["BLACK","BLUE","BROWN","GREEN","GREY","ORANGE","PINK","PURPLE","RED","WHITE","YELLOW"]
/// shapes : ["assets/Database/colors/color/BLACK.png","assets/Database/colors/color/BLUE.png","assets/Database/colors/color/BROWN.png","assets/Database/colors/color/GREEN.png","assets/Database/colors/color/GREY.png","assets/Database/colors/color/ORANGE.png","assets/Database/colors/color/PINK.png","assets/Database/colors/color/PURPLE.png","assets/Database/colors/color/RED.png","assets/Database/colors/color/WHITE.png","assets/Database/colors/color/YELLOW.png"]
/// pictures : ["assets/Database/colors/pictures/BLACK.png","assets/Database/colors/pictures/BLUE.png","assets/Database/colors/pictures/BROWN.png","assets/Database/colors/pictures/GREEN.png","assets/Database/colors/pictures/GREY.png","assets/Database/colors/pictures/ORANGE.png","assets/Database/colors/pictures/PINK.png","assets/Database/colors/pictures/PURPLE.png","assets/Database/colors/pictures/RED.png","assets/Database/colors/pictures/WHITE.png","assets/Database/colors/pictures/YELLOW.png"]
/// sounds : ["assets/Database/colors/Sounds/black.mp3","assets/Database/colors/Sounds/blue.mp3","assets/Database/colors/Sounds/brown.mp3","assets/Database/colors/Sounds/green.mp3","assets/Database/colors/Sounds/grey.mp3","assets/Database/colors/Sounds/orange.mp3","assets/Database/colors/Sounds/pink.mp3","assets/Database/colors/Sounds/purple.mp3","assets/Database/colors/Sounds/red.mp3","assets/Database/colors/Sounds/white.mp3","assets/Database/colors/Sounds/yellow.mp3"]
/// questions : ["What is the name of this color ?"]

class Colurs {
  Colurs({
      this.activity, 
      this.names, 
      this.shapes, 
      this.pictures, 
      this.sounds, 
      this.questions,});

  Colurs.fromJson(dynamic json) {
    activity = json['activity'];
    names = json['names'] != null ? json['names'].cast<String>() : [];
    shapes = json['shapes'] != null ? json['shapes'].cast<String>() : [];
    pictures = json['pictures'] != null ? json['pictures'].cast<String>() : [];
    sounds = json['sounds'] != null ? json['sounds'].cast<String>() : [];
    questions = json['questions'] != null ? json['questions'].cast<String>() : [];
  }
  String? activity;
  List<String>? names;
  List<String>? shapes;
  List<String>? pictures;
  List<String>? sounds;
  List<String>? questions;
Colurs copyWith({  String? activity,
  List<String>? names,
  List<String>? shapes,
  List<String>? pictures,
  List<String>? sounds,
  List<String>? questions,
}) => Colurs(  activity: activity ?? this.activity,
  names: names ?? this.names,
  shapes: shapes ?? this.shapes,
  pictures: pictures ?? this.pictures,
  sounds: sounds ?? this.sounds,
  questions: questions ?? this.questions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['names'] = names;
    map['shapes'] = shapes;
    map['pictures'] = pictures;
    map['sounds'] = sounds;
    map['questions'] = questions;
    return map;
  }

}
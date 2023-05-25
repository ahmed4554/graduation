/// activity : "fruit"
/// Names : ["Apple","Banana","Cherry","Dragon","Elderberry","Fig","Grapes","Honeydew Melon","Imbe Fruit","Jack Fruit","Kiwi","Mango","Nectarine","Orange","Peach","Quince","Raspberries","Strawberry","Tangerine","Ugli fruit","Voavanga","Watermelon","Ximenia Caffra fruit","Yangmei","Zwetschge"]
/// shapes : ["assets/Database/fruits/fruits/apple.png","assets/Database/fruits/fruits/banana.png","assets/Database/fruits/fruits/cherries.png","assets/Database/fruits/fruits/dragon.png","assets/Database/fruits/fruits/elderberry.png","assets/Database/fruits/fruits/fig.png","assets/Database/fruits/fruits/graps.png","assets/Database/fruits/fruits/honeydew melon.png","assets/Database/fruits/fruits/imbe.png","assets/Database/fruits/fruits/jackfruit.png","assets/Database/fruits/fruits/kiwi.png","assets/Database/fruits/fruits/mango.png","assets/Database/fruits/fruits/nectarine.png","assets/Database/fruits/fruits/orange.png","assets/Database/fruits/fruits/peach.png","assets/Database/fruits/fruits/quince.png","assets/Database/fruits/fruits/raspberries.png","assets/Database/fruits/fruits/strawberry.png","assets/Database/fruits/fruits/tangerine.png","assets/Database/fruits/fruits/ug.png","assets/Database/fruits/fruits/voavanga.png","assets/Database/fruits/fruits/watermelon.png","assets/Database/fruits/fruits/ximenia.png","assets/Database/fruits/fruits/yangmei.png","assets/Database/fruits/fruits/z.png"]
/// Sounds : ["assets/Database/fruits/sounds fruits/apple.mp3","assets/Database/fruits/sounds fruits/banana.mp3","assets/Database/fruits/sounds fruits/cherry.mp3","assets/Database/fruits/sounds fruits/dragon.mp3","assets/Database/fruits/sounds fruits/elderberry.mp3","assets/Database/fruits/sounds fruits/fig.mp3","assets/Database/fruits/sounds fruits/grapes.mp3","assets/Database/fruits/sounds fruits/honeydewmelon.mp3","assets/Database/fruits/sounds fruits/imbe.mp3","assets/Database/fruits/sounds fruits/jackfruit.mp3","assets/Database/fruits/sounds fruits/kiwi.mp3","assets/Database/fruits/sounds fruits/mango.mp3","assets/Database/fruits/sounds fruits/nectarine.mp3","assets/Database/fruits/sounds fruits/orange.mp3","assets/Database/fruits/sounds fruits/peach.mp3","assets/Database/fruits/sounds fruits/quince.mp3","assets/Database/fruits/sounds fruits/raspberries.mp3","assets/Database/fruits/sounds fruits/strawberry.mp3","assets/Database/fruits/sounds fruits/tangerine.mp3","assets/Database/fruits/sounds fruits/uglifruit.mp3","assets/Database/fruits/sounds fruits/voavangafruit.mp3","assets/Database/fruits/sounds fruits/watermelon.mp3","assets/Database/fruits/sounds fruits/ximeniacaffrafruit.mp3","assets/Database/fruits/sounds fruits/yangmeifruit.mp3","assets/Database/fruits/sounds fruits/Zwetschge.mp3"]
/// Questions : ["What is this Fruit ?"]

class Fruits {
  Fruits({
      this.activity, 
      this.names, 
      this.shapes, 
      this.sounds, 
      this.questions,});

  Fruits.fromJson(dynamic json) {
    activity = json['activity'];
    names = json['Names'] != null ? json['Names'].cast<String>() : [];
    shapes = json['shapes'] != null ? json['shapes'].cast<String>() : [];
    sounds = json['Sounds'] != null ? json['Sounds'].cast<String>() : [];
    questions = json['Questions'] != null ? json['Questions'].cast<String>() : [];
  }
  String? activity;
  List<String>? names;
  List<String>? shapes;
  List<String>? sounds;
  List<String>? questions;
Fruits copyWith({  String? activity,
  List<String>? names,
  List<String>? shapes,
  List<String>? sounds,
  List<String>? questions,
}) => Fruits(  activity: activity ?? this.activity,
  names: names ?? this.names,
  shapes: shapes ?? this.shapes,
  sounds: sounds ?? this.sounds,
  questions: questions ?? this.questions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['Names'] = names;
    map['shapes'] = shapes;
    map['Sounds'] = sounds;
    map['Questions'] = questions;
    return map;
  }

}
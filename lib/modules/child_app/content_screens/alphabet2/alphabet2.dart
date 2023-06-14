/// activity : "alphabet2"
/// alpha : ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
/// names : ["apple","balloon","cat","duck","elephant","fish","grapes","hat","iguana","jelly","key","lion","moon","nest","orange","pig","quail","rocket","snake","turtle","umbrella","volcano","watermelon","xylophone","yoyo","zebra"]
/// char : ["assets/Database/char/char/a.png","assets/Database/char/char/b.png","assets/Database/char/char/c.png","assets/Database/char/char/d.png","assets/Database/char/char/e.png","assets/Database/char/char/f.png","assets/Database/char/char/g.png","assets/Database/char/char/h.png","assets/Database/char/char/i.png","assets/Database/char/char/j.png","assets/Database/char/char/k.png","assets/Database/char/char/l.png","assets/Database/char/char/m.png","assets/Database/char/char/n.png","assets/Database/char/char/o.png","assets/Database/char/char/p.png","assets/Database/char/char/q.png","assets/Database/char/char/r.png","assets/Database/char/char/s.png","assets/Database/char/char/t.png","assets/Database/char/char/u.png","assets/Database/char/char/v.png","assets/Database/char/char/w.png","assets/Database/char/char/x.png","assets/Database/char/char/y.png","assets/Database/char/char/z.png"]
/// shapes : ["assets/Database/char/images/apple.png","assets/Database/char/images/balloon.png","assets/Database/char/images/cat.png","assets/Database/char/images/duck.png","assets/Database/char/images/egg.png","assets/Database/char/images/fish.png","assets/Database/char/images/grapes.png","assets/Database/char/images/hat.png","assets/Database/char/images/iguana.png","assets/Database/char/images/jelly.png","assets/Database/char/images/key.png","assets/Database/char/images/lion.png","assets/Database/char/images/moon.png","assets/Database/char/images/nest.png","assets/Database/char/images/orange.png","assets/Database/char/images/pig.png","assets/Database/char/images/quail.png","assets/Database/char/images/rocket.png","assets/Database/char/images/snake.png","assets/Database/char/images/turtle.png","assets/Database/char/images/umbrella.png","assets/Database/char/images/volcano.png","assets/Database/char/images/watermelon.png","assets/Database/char/images/xylophone.png","assets/Database/char/images/yoyo.png","assets/Database/char/images/zebra.png",null]
/// sounds : ["Database/char/sounds/Aapple.mp3","Database/char/sounds/BBallon.mp3","Database/char/sounds/Ccat.mp3","Database/char/sounds/DDuck.mp3","Database/char/sounds/EElephant.mp3","Database/char/sounds/FFish.mp3","Database/char/sounds/GGrapes.mp3","Database/char/sounds/HHat.mp3","Database/char/sounds/IIguana.mp3","Database/char/sounds/JJelly.mp3","Database/char/sounds/KKey.mp3","Database/char/sounds/LLion.mp3","Database/char/sounds/MMoon.mp3","Database/char/sounds/NNest.mp3","Database/char/sounds/OOrange.mp3","Database/char/sounds/PPig.mp3","Database/char/sounds/QQuail.mp3","Database/char/sounds/RRocket.mp3","Database/char/sounds/SSnake.mp3","Database/char/sounds/TTurtle.mp3","Database/char/sounds/UUmbrella.mp3","Database/char/sounds/VVolcano.mp3","Database/char/sounds/WWatermelon.mp3","Database/char/sounds/XXylophone.mp3","Database/char/sounds/YYOYO.mp3","Database/char/sounds/ZZebra.mp3"]

class Alphabet2 {
  Alphabet2({
      this.activity, 
      this.alpha, 
      this.names, 
      this.char, 
      this.shapes, 
      this.sounds,
  });

  Alphabet2.fromJson(dynamic json) {
    activity = json['activity'];
    alpha = json['alpha'] != null ? json['alpha'].cast<String>() : [];
    names = json['names'] != null ? json['names'].cast<String>() : [];
    char = json['char'] != null ? json['char'].cast<String>() : [];
    shapes = json['shapes'] != null ? json['shapes'].cast<String>() : [];
    sounds = json['sounds'] != null ? json['sounds'].cast<String>() : [];
  }
  String? activity;
  List<String>? alpha;
  List<String>? names;
  List<String>? char;
  List<String>? shapes;
  List<String>? sounds;
Alphabet2 copyWith({  String? activity,
  List<String>? alpha,
  List<String>? names,
  List<String>? char,
  List<String>? shapes,
  List<String>? sounds,
}) => Alphabet2(  activity: activity ?? this.activity,
  alpha: alpha ?? this.alpha,
  names: names ?? this.names,
  char: char ?? this.char,
  shapes: shapes ?? this.shapes,
  sounds: sounds ?? this.sounds,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['alpha'] = alpha;
    map['names'] = names;
    map['char'] = char;
    map['shapes'] = shapes;
    map['sounds'] = sounds;
    return map;
  }

}
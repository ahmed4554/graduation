/// activity : "alphabet"
/// alpha : ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
/// names : ["apple","ball","cat","duck","elephant","fish","grapes","hat","iguana","jelly","key","lion","moon","nest","orange","pig","quail","rocket","snake","turtle","umbrella","volcano","watermelon","xylophone","yoyo","zebra"]
/// picture : ["assets/Database/char/char/a.png","assets/Database/char/char/b.png","assets/Database/char/char/c.png","assets/Database/char/char/d.png","assets/Database/char/char/e.png","assets/Database/char/char/f.png","assets/Database/char/char/g.png","assets/Database/char/char/h.png","assets/Database/char/char/i.png","assets/Database/char/char/j.png","assets/Database/char/char/k.png","assets/Database/char/char/l.png","assets/Database/char/char/m.png","assets/Database/char/char/n.png","assets/Database/char/char/o.png","assets/Database/char/char/p.png","assets/Database/char/char/q.png","assets/Database/char/char/r.png","assets/Database/char/char/s.png","assets/Database/char/char/t.png","assets/Database/char/char/u.png","assets/Database/char/char/v.png","assets/Database/char/char/w.png","assets/Database/char/char/x.png","assets/Database/char/char/y.png","assets/Database/char/char/z.png"]
/// shapes : ["assets/Database/char/images/apple.png","assets/Database/char/images/ball.png","assets/Database/char/images/cat.png","assets/Database/char/images/duck.png","assets/Database/char/images/elephant.png","assets/Database/char/images/fish.png","assets/Database/char/images/grapes.png","assets/Database/char/images/hat.png","assets/Database/char/images/jelly.png","assets/Database/char/images/key.png","assets/Database/char/images/lion.png","assets/Database/char/images/moon.png","assets/Database/char/images/nest.png","assets/Database/char/images/orange.png","assets/Database/char/images/pig.png","assets/Database/char/images/quail.png","assets/Database/char/images/rocket.png","assets/Database/char/images/snake.png","assets/Database/char/images/turtle.png","assets/Database/char/images/umbrella.png","assets/Database/char/images/volcano.png","assets/Database/char/images/watermelon.png","assets/Database/char/images/xylophone.png","assets/Database/char/images/yoyo.png","assets/Database/char/images/zebra.png"]
/// images : ["assets/Database/char/images/apple.png","assets/Database/char/images/ball.png","assets/Database/char/images/cat.png","assets/Database/char/images/duck.png","assets/Database/char/images/elephant.png","assets/Database/char/images/fish.png","assets/Database/char/images/grapes.png","assets/Database/char/images/hat.png","assets/Database/char/images/iguana.png","assets/Database/char/images/jelly.png","assets/Database/char/images/key.png","assets/Database/char/images/lion.png","assets/Database/char/images/moon.png","assets/Database/char/images/nest.png","assets/Database/char/images/orange.png","assets/Database/char/images/pig.png","assets/Database/char/images/quail.png","assets/Database/char/images/rocket.png","assets/Database/char/images/snake.png","assets/Database/char/images/turtle.png","assets/Database/char/images/umbrella.png","assets/Database/char/images/volcano.png","assets/Database/char/images/watermelon.png","assets/Database/char/images/xylophone.png","assets/Database/char/images/yoyo.png","assets/Database/char/images/zebra.png",null]
/// sounds : ["assets/Database/char/Voice/A apple.mp3","assets/Database/char/Voice/B Ballon.mp3","assets/Database/char/Voice/C cat.mp3","assets/Database/char/Voice/D Duck.mp3","assets/Database/char/Voice/E Egg.mp3","assets/Database/char/Voice/F Fish.mp3","assets/Database/char/Voice/G Glasses.mp3","assets/Database/char/Voice/H Heart.mp3","assets/Database/char/Voice/I Ice craem.mp3","assets/Database/char/Voice/J Jellyfish.mp3","assets/Database/char/Voice/K Key.mp3","assets/Database/char/Voice/L Lemon.mp3","assets/Database/char/Voice/M Moon.mp3","assets/Database/char/Voice/N Nest.mp3","assets/Database/char/Voice/O Orange.mp3","assets/Database/char/Voice/P Penguin.mp3","assets/Database/char/Voice/Q Queen.mp3","assets/Database/char/Voice/R Rainbow.mp3","assets/Database/char/Voice/S star.mp3","assets/Database/char/Voice/T Tooth.mp3","assets/Database/char/Voice/U Umbrella.mp3","assets/Database/char/Voice/V Volcano.mp3","assets/Database/char/Voice/W Watermelon.mp3","assets/Database/char/Voice/X Xylophone.mp3","assets/Database/char/Voice/Y Yellow.mp3","assets/Database/char/Voice/Z Zig Zag.mp3"]

class Alphabet {
  Alphabet({
      this.activity, 
      this.alpha, 
      this.names, 
      this.pictures,
      this.shapes, 
      this.images, 
      this.sounds,});

  Alphabet.fromJson(dynamic json) {
    activity = json['activity'];
    alpha = json['alpha'] != null ? json['alpha'].cast<String>() : [];
    names = json['names'] != null ? json['names'].cast<String>() : [];
    pictures = json['pictures'] != null ? json['pictures'].cast<String>() : [];
    shapes = json['shapes'] != null ? json['shapes'].cast<String>() : [];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    sounds = json['sounds'] != null ? json['sounds'].cast<String>() : [];
  }
  String? activity;
  List<String>? alpha;
  List<String>? names;
  List<String>? pictures;
  List<String>? shapes;
  List<String>? images;
  List<String>? sounds;
Alphabet copyWith({  String? activity,
  List<String>? alpha,
  List<String>? names,
  List<String>? pictures,
  List<String>? shapes,
  List<String>? images,
  List<String>? sounds,
}) => Alphabet(  activity: activity ?? this.activity,
  alpha: alpha ?? this.alpha,
  names: names ?? this.names,
  pictures: pictures ?? this.pictures,
  shapes: shapes ?? this.shapes,
  images: images ?? this.images,
  sounds: sounds ?? this.sounds,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['alpha'] = alpha;
    map['names'] = names;
    map['pictures'] = pictures;
    map['shapes'] = shapes;
    map['images'] = images;
    map['sounds'] = sounds;
    return map;
  }

}
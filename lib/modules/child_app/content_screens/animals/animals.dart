/// activity : "animals"
/// names : ["Ant","Bear","Crocodile","Dog","Elephant","Fox","Giraffe","Horse","Iguana","Jellyfish","kangaroo","Lion","Monkey","Numba","Owl","Penguin","Quail","Rooster","Sheep","Tiger","Unicorn","Vulture","Whale","Xenops","Yak","Zebra"]
/// pictures : ["assets/Database/animals/images/Ant.png","assets/Database/animals/images/Bear.png","assets/Database/animals/images/Crocodile.png","assets/Database/animals/images/Dog.png","assets/Database/animals/images/Elephant.png","assets/Database/animals/images/Fox.png","assets/Database/animals/images/Giraffe.png","assets/Database/animals/images/Horse.png","assets/Database/animals/images/Iguana.png","assets/Database/animals/images/Jellyfish.png","assets/Database/animals/images/Kangaroo.png","assets/Database/animals/images/Lion.png","assets/Database/animals/images/Monkey.png","assets/Database/animals/images/Numba.png","assets/Database/animals/images/Owl.png","assets/Database/animals/images/Penguin.png","assets/Database/animals/images/Quail.png","assets/Database/animals/images/Rooster.png","assets/Database/animals/images/Sheep.png","assets/Database/animals/images/Tiger.png","assets/Database/animals/images/Unicorn.png","assets/Database/animals/images/Vulture.png","assets/Database/animals/images/Whale.png","assets/Database/animals/images/Xenops.png","assets/Database/animals/images/Yak.png","assets/Database/animals/images/Zebra.png"]
/// sounds : ["assets/Database/animals/Sounds/ant.mp3","assets/Database/animals/Sounds/bear.mp3","assets/Database/animals/Sounds/crocodile.mp3","assets/Database/animals/Sounds/dog.mp3","assets/Database/animals/Sounds/elephant.mp3","assets/Database/animals/Sounds/fox.mp3","assets/Database/animals/Sounds/giraffe.mp3","assets/Database/animals/Sounds/horse.mp3","assets/Database/animals/Sounds/iguana.mp3","assets/Database/animals/Sounds/jellyfish.mp3","assets/Database/animals/Sounds/kangaroo.mp3","assets/Database/animals/Sounds/lion.mp3","assets/Database/animals/Sounds/monkey.mp3","assets/Database/animals/Sounds/numba.mp3","assets/Database/animals/Sounds/owl.mp3","assets/Database/animals/Sounds/penguin.mp3","assets/Database/animals/Sounds/quail.mp3","assets/Database/animals/Sounds/rooster.mp3","assets/Database/animals/Sounds/sheep.mp3","assets/Database/animals/Sounds/tiger.mp3","assets/Database/animals/Sounds/unicorn.mp3","assets/Database/animals/Sounds/vulture.mp3","assets/Database/animals/Sounds/whale.mp3","assets/Database/animals/Sounds/xenops.mp3","assets/Database/animals/Sounds/yak.mp3","assets/Database/animals/Sounds/zebra.mp3"]
/// questions : ["What is the Animal?"]

class Animals {
  Animals({
      this.activity, 
      this.names,
      this.shapes,
      this.sounds, 
      this.questions,});

  Animals.fromJson(dynamic json) {
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
Animals copyWith({  String? activity,
  List<String>? names,
  List<String>? shapes,
  List<String>? sounds,
  List<String>? questions,
}) => Animals(  activity: activity ?? this.activity,
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
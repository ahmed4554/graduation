/// activity : "alphabet"
/// names : ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
/// char : ["assets/Database/char/char/a.png","assets/Database/char/char/b.png","assets/Database/char/char/c.png","assets/Database/char/char/d.png","assets/Database/char/char/e.png","assets/Database/char/char/f.png","assets/Database/char/char/g.png","assets/Database/char/char/h.png","assets/Database/char/char/i.png","assets/Database/char/char/j.png","assets/Database/char/char/k.png","assets/Database/char/char/l.png","assets/Database/char/char/m.png","assets/Database/char/char/n.png","assets/Database/char/char/o.png","assets/Database/char/char/p.png","assets/Database/char/char/q.png","assets/Database/char/char/r.png","assets/Database/char/char/s.png","assets/Database/char/char/t.png","assets/Database/char/char/u.png","assets/Database/char/char/v.png","assets/Database/char/char/w.png","assets/Database/char/char/x.png","assets/Database/char/char/y.png","assets/Database/char/char/z.png"]
/// shapes : ["assets/Database/char/char/a.png","assets/Database/char/char/b.png","assets/Database/char/char/c.png","assets/Database/char/char/d.png","assets/Database/char/char/e.png","assets/Database/char/char/f.png","assets/Database/char/char/g.png","assets/Database/char/char/h.png","assets/Database/char/char/i.png","assets/Database/char/char/j.png","assets/Database/char/char/k.png","assets/Database/char/char/l.png","assets/Database/char/char/m.png","assets/Database/char/char/n.png","assets/Database/char/char/o.png","assets/Database/char/char/p.png","assets/Database/char/char/q.png","assets/Database/char/char/r.png","assets/Database/char/char/s.png","assets/Database/char/char/t.png","assets/Database/char/char/u.png","assets/Database/char/char/v.png","assets/Database/char/char/w.png","assets/Database/char/char/x.png","assets/Database/char/char/y.png","assets/Database/char/char/z.png"]
/// sounds : ["assets/Database/char/chars/A.mp3","assets/Database/char/chars/B.mp3","assets/Database/char/chars/C.mp3","assets/Database/char/chars/D.mp3","assets/Database/char/chars/E.mp3","assets/Database/char/chars/F.mp3","assets/Database/char/chars/G.mp3","assets/Database/char/chars/H.mp3","assets/Database/char/chars/I.mp3","assets/Database/char/chars/J.mp3","assets/Database/char/chars/K.mp3","assets/Database/char/chars/L.mp3","assets/Database/char/chars/M.mp3","assets/Database/char/chars/N.mp3","assets/Database/char/chars/O.mp3","assets/Database/char/chars/P.mp3","assets/Database/char/chars/Q.mp3","assets/Database/char/chars/R.mp3","assets/Database/char/chars/S.mp3","assets/Database/char/chars/T.mp3","assets/Database/char/chars/U.mp3","assets/Database/char/chars/V.mp3","assets/Database/char/chars/W.mp3","assets/Database/char/chars/X.mp3","assets/Database/char/chars/Y.mp3","assets/Database/char/chars/Z.mp3"]

class Alphabet {
  Alphabet({
      this.activity, 
      this.names, 
      this.char, 
      this.shapes, 
      this.sounds,});

  Alphabet.fromJson(dynamic json) {
    activity = json['activity'];
    names = json['names'] != null ? json['names'].cast<String>() : [];
    char = json['char'] != null ? json['char'].cast<String>() : [];
    shapes = json['shapes'] != null ? json['shapes'].cast<String>() : [];
    sounds = json['sounds'] != null ? json['sounds'].cast<String>() : [];
  }
  String? activity;
  List<String>? names;
  List<String>? char;
  List<String>? shapes;
  List<String>? sounds;
Alphabet copyWith({  String? activity,
  List<String>? names,
  List<String>? char,
  List<String>? shapes,
  List<String>? sounds,
}) => Alphabet(  activity: activity ?? this.activity,
  names: names ?? this.names,
  char: char ?? this.char,
  shapes: shapes ?? this.shapes,
  sounds: sounds ?? this.sounds,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['names'] = names;
    map['char'] = char;
    map['shapes'] = shapes;
    map['sounds'] = sounds;
    return map;
  }

}
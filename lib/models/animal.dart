class AnimalsModel {
  late String activity;
  late List<String> names;
  late List<String> shapes;
  late List<String> sounds;
  List<AnimalsQuestion> animalsQuestions = [];
  AnimalsModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    names = json['names'];
    shapes = json['shapes'];
    sounds = json['sounds'];
    json['questions'].forEach((e) {
      animalsQuestions.add(AnimalsQuestion.fromJson(e));
    });
  }
}

class AnimalsQuestion {
  late String text;
  late String pic = '';
  late String answer, kind;
  late List<String> options;

  AnimalsQuestion.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    pic = json['pic'];
    answer = json['answer'];
    options = json['options'];
    kind = json['kind'];
  }
}
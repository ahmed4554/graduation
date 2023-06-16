class FollowChildModel {
  String? activity, pic;
  double? progress;
  FollowChildModel.fromJson(Map<String, dynamic> json) {
    activity = json['category'] ?? '';
    pic = json['pic'] ?? '';
    progress = json['progress'] ?? 0;
  }
}

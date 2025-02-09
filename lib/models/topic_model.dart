import 'package:lms_app/models/lesson_model.dart';

class Topic {
  String id;
  String title;
  String totalDuration;
  List<Lesson> lessons;

  Topic({
    required this.id,
    required this.title,
    required this.totalDuration,
    required this.lessons,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      totalDuration: json['totalDuration'] ?? '',
      lessons: (json['lessons'] as List).map((e) => Lesson.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'totalDuration': totalDuration,
      'lessons': lessons.map((e) => e.toJson()).toList(),
    };
  }
}

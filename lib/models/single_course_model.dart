import 'package:lms_app/models/topic_model.dart';

class SingleCourseModel {
  String id;
  String title;
  String description;
  int price;
  String teacher;
  bool isPurchased;
  String preview;
  String thumbnail;
  String type;
  int duration;
  String category;
  String status;
  int rating;
  int studentsCount;
  DateTime createdAt;
  int discountPercent;
  List<Topic> topics;

  SingleCourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.teacher,
    required this.isPurchased,
    required this.preview,
    required this.thumbnail,
    required this.type,
    required this.duration,
    required this.category,
    required this.status,
    required this.rating,
    required this.studentsCount,
    required this.createdAt,
    required this.discountPercent,
    required this.topics,
  });

  factory SingleCourseModel.fromJson(Map<String, dynamic> json) {
    return SingleCourseModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      teacher: json['teacher'],
      isPurchased: json['isPurchased'],
      preview: json['preview'],
      thumbnail: json['thumbnail'],
      type: json['type'],
      duration: json['duration'],
      category: json['category'],
      status: json['status'],
      rating: json['rating'],
      studentsCount: json['studentsCount'],
      createdAt: DateTime.parse(json['createdAt']),
      discountPercent: json['discountPercent'],
      topics: (json['topics'] as List).map((e) => Topic.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'teacher': teacher,
      'isPurchased': isPurchased,
      'preview': preview,
      'thumbnail': thumbnail,
      'type': type,
      'duration': duration,
      'category': category,
      'status': status,
      'rating': rating,
      'studentsCount': studentsCount,
      'createdAt': createdAt.toIso8601String(),
      'discountPercent': discountPercent,
      'topics': topics.map((e) => e.toJson()).toList(),
    };
  }
}

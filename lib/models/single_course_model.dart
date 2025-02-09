import 'package:lms_app/models/topic_model.dart';

class SingleCourseModel {
  String? id;
  String? title;
  String? description;
 double? price;
  String? teacher;
  bool? isPurchased;
  String? preview;
  String? thumbnail;
  String? type;
  int? duration;
  String? category;
  String? status;
  double? rating;
  int? studentsCount;
  DateTime? createdAt;
  int? discountPercent;
  List<Topic>? topics;

  SingleCourseModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.teacher,
    this.isPurchased,
    this.preview,
    this.thumbnail,
    this.type,
    this.duration,
    this.category,
    this.status,
    this.rating,
    this.studentsCount,
    this.createdAt,
    this.discountPercent,
    this.topics,
  });

  factory SingleCourseModel.fromJson(Map<String, dynamic> json) {
    return SingleCourseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      teacher: json['teacher'] ?? '',
      isPurchased: json['isPurchased'] ?? false,
      preview: json['preview'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      type: json['type'] ?? '',
      duration: json['duration']  ?? 0,
      category: json['category'] ?? '',
      status: json['status']  ?? '',
      rating: (json['rating'] as num?)?.toDouble()  ?? 0.0,
      studentsCount: json['studentsCount']  ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().microsecondsSinceEpoch.toString()),
      discountPercent: json['discountPercent'] ?? 0,
      topics: (json['topics'] as List).map((e) => Topic.fromJson(e)).toList() ,
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
      'createdAt': createdAt?.toIso8601String(),
      'discountPercent': discountPercent,
      'topics': topics?.map((e) => e.toJson()).toList(),
    };
  }
}

import 'package:lms_app/models/question_modeel.dart';

class ExamModel {
  String? title;
  List<Question>? questions;
  bool? isFree;
  String? id;
  double? price;
  bool? isPurchased;
  ExamModel({required this.title,  this.questions,  this.price , this.isFree, this.id , this.isPurchased});

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      title: json['title'] ?? '',
      isFree: json['isFree'] ?? false,
      id: json['_id'] ?? '',
      questions: json['questions'] != null ? (json['questions'] as List).map((e) => Question.fromJson(e)).toList() : [] ,
       price: (json['price']as num?)?.toDouble() ?? 0.0  ,
        isPurchased: json['isPurchased'] ?? false
      )
    ;
  }
   factory ExamModel.fromJsonPay(Map<String, dynamic> json) {
    return ExamModel(
      title: json['title'] ?? '',
      isFree: json['isFree'] ?? false,
      id: json['_id'] ?? '',
      questions: [] ,
       price: (json['price']as num?)?.toDouble() ?? 0.0  ,
       isPurchased: json['isPurchased'] ?? false
      )
    ;
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'questions': questions,
      'isFree': isFree,
      '_id': id,
      'price': price,
      "isPurchased" : isPurchased
    };
  }
}

class ResultModel {
  final String message;
  final int score;
  final int correctAnswer;
  final int wrongAnswer;
  final int attemptedQuestions;
  final int skippedQuestions;

  ResultModel({
    required this.message,
    required this.score,
    required this.correctAnswer,
    required this.wrongAnswer,
    required this.attemptedQuestions,
    required this.skippedQuestions,
  });

  // Factory constructor to create an object from JSON
  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      message: json["message"] ?? "",
      score: json["score"] ?? 0,
      correctAnswer: json["correctAnswer"] ?? 0,
      wrongAnswer: json["wrongAnswer"] ?? 0,
      attemptedQuestions: json["attemptedQuestions"] ?? 0,
      skippedQuestions: json["skippedQuestions"] ?? 0,
    );
  }

  // Convert object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "score": score,
      "correctAnswer": correctAnswer,
      "wrongAnswer": wrongAnswer,
      "attemptedQuestions": attemptedQuestions,
      "skippedQuestions": skippedQuestions,
    };
  }
}

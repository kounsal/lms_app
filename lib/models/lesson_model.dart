
class Lesson {
  String id;
  String title;
  String content;
  String type;
  int duration;
  List<dynamic> questions;
  bool isPurchased;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.duration,
    required this.questions,
    required this.isPurchased,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      type: json['type'],
      duration: json['duration'],
      questions: json['questions'] ?? [],
      isPurchased: json['isPurchased'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'type': type,
      'duration': duration,
      'questions': questions,
      'isPurchased': isPurchased,
    };
  }
}

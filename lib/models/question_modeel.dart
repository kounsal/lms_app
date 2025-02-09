class Question {
  String id;
  String question;
  List<String> answer;
  String correctAnswer;
  String selectedOption = '';

  Question({required this.question, required this.answer, required this.correctAnswer , required this.id});


  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'] ?? '',
      question: json['question'] ?? '',
      answer: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'] ?? '',
    );
  }
  //to json
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'question': question,
      'options': answer,
      'correctAnswer': correctAnswer,
    };
  }
}
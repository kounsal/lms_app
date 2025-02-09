import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_quiz/quick_quiz.dart';

class QuizController extends GetxController
{
  RxList<Map<String,Quiz>> quiz = <Map<String,Quiz>>[].obs;
  RxList<QuestionModel> quizList = <QuestionModel>[].obs;

@override
void onInit() {
  loadQuizFromAsset();
  super.onInit();

  
}

Future<void> loadQuizFromAsset() async {
    print("Loading Quiz");
    String jsonString = await rootBundle.loadString('assets/json/neet_questions_updated.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<QuestionModel> questions = jsonList.map((json) {
      return QuestionModel(
        question: json['question'],
        options: List<String>.from(json['options']),
        correctAnswerIndex: json['correctAnswer'],
      );
    }).toList();

    Quiz newquiz = Quiz(
      timerDuration: 200*60,
      questions: questions);

    quiz.add({"NEET PREP":newquiz});




    

}



}
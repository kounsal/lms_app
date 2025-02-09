import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/helpers/api_helper.dart';
import 'package:lms_app/models/exam_model.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/app_urls.dart';
import 'package:lms_app/views/categories_screen.dart/widgets/testResult.dart';

class TakeTestController extends GetxController {
   final String examId;
  final int totalTimeInSeconds;
  late Timer _timer;
  var remainingTime = 0.obs;
  var selectedAnswers = <String, int>{}.obs; 
  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;
  // Stores selected answers

  TakeTestController( {required this.totalTimeInSeconds , required this.examId}){
    remainingTime.value = totalTimeInSeconds;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
        autoSubmit();
      }
    });
  }

  void selectAnswer(String questionId, int answer) {
    selectedAnswers[questionId] = answer;
  }

  void autoSubmit() {
    print("Time up! Submitting test...");
    submitTest();
  }

  Future<void> submitTest() async{
    isLoading.value = true;
    isSubmitting.value = true;
    var result ;
    try{
       var res = await  ApiHelper.post(AppUrls.submitExam,jsonEncode({
        "examId": examId,
        "answers": selectedAnswers.entries
              .map((entry) => {
                    "questionId": entry.key,
                    "selectedAnswer": entry.value,
                  })
              .toList(),
       }));
       if(res != null){
        result = ResultModel.fromJson(res);
        }
      Get.to(()=>TestResultScreen(result: result,));
    }
    catch(e){
      Get.snackbar("Error", "Error submitting test ! Try again later" , snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      print("Error submitting test: $e");
    }
    finally{
      isLoading.value = false;
    }
 
    // Add API call or database storage logic here
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}

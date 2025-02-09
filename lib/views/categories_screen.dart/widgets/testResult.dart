import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/takeTestController.dart';
import 'package:lms_app/models/exam_model.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/views/HomeScreen/home_screen.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({super.key, required this.result});
  final ResultModel result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: Image.asset(
                            "assets/images/logo.webp",
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Test Result",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue)),
                        Text(
                          "Your Score is ${result.score}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Correct Answers : ${result.correctAnswer}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Wrong Answers : ${result.wrongAnswer}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Attempted Questions : ${result.attemptedQuestions}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ))),
              )
               ,
               MaterialButton(
                  height: 70,
                  minWidth: double.infinity,
                  onPressed: () async {
                    Get.delete<TakeTestController>();
                    Get.offAll(() => HomeScreen());
                    // Get.to(() => TakeTest(exam: widget.exam));
                  },
                  color: AppColors.primary,
                  child: Text(
                    'Return Home',
                    style: TextStyle(color: Colors.white),
                  ),
                )
            
            ],
          ),
        ],
      ),
    );
  }
}

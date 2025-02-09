import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/takeTestController.dart';
import 'package:lms_app/models/exam_model.dart';
import 'package:lms_app/models/purchase_model.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/views/payment/payment_view.dart';

class TestContent extends StatefulWidget {
  const TestContent({super.key, required this.exam});

  final ExamModel exam;

  @override
  State<TestContent> createState() => _TestContentState();
}

class _TestContentState extends State<TestContent> {
  // Store selected option indexes
  Map<int, int> selectedIndexes = {};

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
                        Text(widget.exam.title ?? "",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary)),

                        Text(
                          "Durations : 90 mins ",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Description : ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary)),
                        SizedBox(
                          height: 4,
                        ),
                        // Text(widget.exam..description, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400 , color: AppColors.primary)),
                      ],
                    ),
                  ),
                ),
              ),
              widget.exam.isPurchased!
                  ? MaterialButton(
                      height: 70,
                      minWidth: double.infinity,
                      onPressed: () async {
                        Get.to(() => TakeTest(exam: widget.exam));
                      },
                      color: AppColors.primary,
                      child: Text(
                        'Take Test',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 70,
                      width: double.infinity,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rs.${widget.exam.price}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              Get.to(() => PaymentViewPage(
                                    purchasee: PurchaseModel(
                                      id: widget.exam.id!,
                                      name: widget.exam.title ?? "",
                                      price: widget.exam.price!,
                                      type: 'exam',
                                      imageUrl: "widget.plan.thumbnail",
                                      description: "widget.plan.description",
                                      email: "",
                                      contact: "",
                                    ),
                                  ));
                            },
                            color: AppColors.primary,
                            child: Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class TakeTest extends StatelessWidget {
  final ExamModel exam;
  TakeTest({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final TakeTestController controller =
        Get.put(TakeTestController(totalTimeInSeconds: 18 , examId: exam.id!)); // 30 min exam

    return Scaffold(
      appBar: AppBar(
        title: Text("Take Test"),
        actions: [
          Obx(() => Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Text(
                  "Time Left: ${controller.remainingTime.value ~/ 60}m ${controller.remainingTime.value % 60}s",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: exam.questions?.length,
                    itemBuilder: (context, index) {

                      final question = exam.questions?[index];
                      var questionId = question?.id;
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Q${index + 1}: ${question?.question}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Column(
                                children: List.generate(
                                  question!.answer.length,
                                  (optionIndex) => Obx(() {
                                    return RadioListTile<int>(
                                      title: Text(question.answer[optionIndex]),
                                      value: optionIndex,
                                      groupValue:
                                          controller.selectedAnswers[questionId],
                                      onChanged: (value) {
                                        controller.selectAnswer(questionId!, value!);
                                      },
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.submitTest,
                  child: Text("Submit Test"),
                ),
              ],
            ),
          ),
          Obx(() => controller.isLoading.value && controller.isSubmitting.value
              ? IgnorePointer(
                child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text("Submitting Test..."),
                        ],
                      ),
                    ),
                  ),
              )
              : SizedBox.shrink()),
        ],
      ),
    );
  }
}

  // Store selected option indexes
  
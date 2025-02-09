import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/controllers/quiz_controller.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/utils/themes.dart';
import 'package:quick_quiz/quick_quiz.dart';

class QuizScreeen extends StatefulWidget {
  const QuizScreeen({super.key});

  @override
  State<QuizScreeen> createState() => _QuizScreeenState();
}

class _QuizScreeenState extends State<QuizScreeen> {
  final controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    // final courseController = Get.put(CourseController());
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Quizes'),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: controller.quiz.length,
            itemBuilder: (context, index) {
              var quizMap = controller.quiz[index];
              var quizKey = quizMap.keys.first;
              var quiz = quizMap[quizKey]!;
              return GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Scaffold(body: QuizPage(quiz: quiz))));

                  // await courseController.getCourseDetails(quiz.id);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  height: 130,
                  width: size.width * .8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black.withOpacity(.050),
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        children: [
                          Container(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth * .4,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.1),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              child: 
                              Image.network(
                                "" ?? "",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/logo.webp',
                                    fit: BoxFit.contain,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  quizKey ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextFormat.extraSmall(
                                  text:
                                      'Duration ${(quiz.timerDuration?? 0) /60 } minutes',
                                  opacity: .5,
                                ),
                                // data.isFree ?? false
                                //     ? TextFormat.small(
                                //         text: 'Free',
                                //         textColor: AppColors.primary,
                                //         fontWeight: FontWeight.w700)
                                //     : data.priceWithDiscount != null
                                //         ? Row(
                                //             children: [
                                //               TextFormat.small(
                                //                   text:
                                //                       'Rs.${data.priceWithDiscount}',
                                //                   textColor:
                                //                       AppColors.primary,
                                //                   fontWeight:
                                //                       FontWeight.w700),
                                //               const SizedBox(
                                //                 width: 10,
                                //               ),
                                //               TextFormat.small(
                                //                   text: 'Rs.${data.price}',
                                //                   decoration: TextDecoration
                                //                       .lineThrough),
                                //             ],
                                //           )
                                //         : TextFormat.small(
                                //             text: 'Rs.${data.price}',
                                //             textColor: AppColors.primary,
                                //             fontWeight: FontWeight.w700),
                              ],
                            ),
                          ))
                        ],
                      );
                    },
                  ),
                ),
              );

              // ListTile(
              //   title: Text('Quiz ${index + 1}'),
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: QuizPage(quiz: quiz))));
              //   },
              // );
            });
      }),
    );
  }
}

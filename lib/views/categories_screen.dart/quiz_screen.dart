import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/utils/themes.dart';
import 'package:quick_quiz/quick_quiz.dart';

class QuizScreeen extends StatefulWidget {
  const QuizScreeen({super.key});

  @override
  State<QuizScreeen> createState() => _QuizScreeenState();
}

class _QuizScreeenState extends State<QuizScreeen> {
  final quiz = Quiz(
      questions: [
        QuestionModel(
          question: 'How is acceleration related to mass and force according to Newton\'s second law of motion?',
          options: ['Acceleration is directly proportional to mass and inversely proportional to force', 'Acceleration is directly proportional to force and mass', 'Acceleration is inversely proportional to mass and force', 'Acceleration is inversely proportional to force and directly proportional to mass'],
          correctAnswerIndex: 0,
        ),
        QuestionModel(
          question: 'What is the largest planet in our solar system?',
          options: ['Earth', 'Jupiter', 'Mars', 'Saturn'],
          correctAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Which animal is known as the "King of the Jungle"?',
          options: ['Tiger', 'Lion', 'Elephant', 'Bear'],
          correctAnswerIndex: 1,
        ),
      ],
      timerDuration: 30,
    ); 
  
  @override
  Widget build(BuildContext context) {
        final courseController = Get.put(CourseController());
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avsailable Quizes'),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: QuizPage(quiz: quiz))));
        
            // await courseController.getCourseDetails(quiz.id);
          },
          child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                                child: Image.network(
                                  "" ?? "",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.broken_image_outlined,
                                      color: Colors.red,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "FREE QUIZ" ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      TextFormat.extraSmall(
                                        text:
                                            'By {data.teacher?.name ?? AppConfig.appName}' ,
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
                                  // GestureDetector(
                                  //   onTap: () async {
                                  //     await courseController
                                  //         .getCourseDetails(data.id);
                                  //   },
                                  //   child: Container(
                                  //     width: constraints.maxWidth * .5,
                                  //     decoration: BoxDecoration(
                                  //         border: Border.all(
                                  //           color: AppColors.primary,
                                  //         ),
                                  //         borderRadius:
                                  //             BorderRadius.circular(10)),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.symmetric(
                                  //         horizontal: 15,
                                  //         vertical: 5,
                                  //       ),
                                  //       child: Center(
                                  //         child: data.isFree ?? false
                                  //             ? Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceEvenly,
                                  //                 children: [
                                  //                   Icon(
                                  //                     Icons.shopping_cart,
                                  //                     size: 20,
                                  //                     color: AppColors.primary,
                                  //                   ),
                                  //                   Text(
                                  //                     'Enroll Now',
                                  //                     style: GoogleFonts.poppins(
                                  //                       color: AppColors.primary,
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               )
                                  //             : Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceEvenly,
                                  //                 children: [
                                  //                   Icon(
                                  //                     Icons.shopping_cart,
                                  //                     size: 20,
                                  //                     color: AppColors.primary,
                                  //                   ),
                                  //                   Text(
                                  //                     'Buy Now',
                                  //                     style: GoogleFonts.poppins(
                                  //                       color: AppColors.primary,
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )
                                
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
      }),);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/controllers/exam_controller.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/utils/config.dart';
import 'package:lms_app/utils/themes.dart';
// import 'package:lms_app/views/categories_screen.dart/widgets/test_content.dart';

class TestSeriesScreeen extends StatefulWidget {
  const TestSeriesScreeen({super.key});

  @override
  State<TestSeriesScreeen> createState() => _TestSeriesScreeenState();
}

class _TestSeriesScreeenState extends State<TestSeriesScreeen> {
  final controller = Get.put(ExamController());
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Stack(
        children: [
          Obx(() {
            return ListView.builder(
                itemCount: controller.exams.length,
                itemBuilder: (context, index) {
                  var examdata = controller.exams[index];
                  return GestureDetector(
                    onTap: () async {
                      await controller.getExamData(examdata.id!);
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
                                  child: Image.network(
                                    "image url" ?? "",
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          examdata.title ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        TextFormat.extraSmall(
                                          text: 'By ${AppConfig.appName}',
                                          opacity: .5,
                                        ),
                                        authController.user.value!.purchasedExam?.any((element) => element.id == examdata.id) ?? false
                                            ? TextFormat.small(
                                                text: 'Purchased',
                                                textColor: AppColors.primary,
                                                fontWeight: FontWeight.w700)
                                            :
                                        examdata.isFree ?? false
                                            ? TextFormat.small(
                                                text: 'Free',
                                                textColor: AppColors.primary,
                                                fontWeight: FontWeight.w700)
                                            : TextFormat.small(
                                                text: 'Rs.${examdata.price ?? 0.0}',
                                                textColor: AppColors.primary,
                                                fontWeight: FontWeight.w700),
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
                });
          }),
          Obx((){return controller.isLoading.value ? Container(
            height: size.height,
            width: size.width,
            color: Colors.black.withOpacity(.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ) : const SizedBox();})
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/themes.dart';
import '../../../utils/colors.dart';

class LatestCoursesSection extends StatelessWidget {
  const LatestCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontroller = Get.find<AuthController>();
    final controller = Get.find<CourseController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Latest Courses',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            GestureDetector(
               onTap: (){
                Get.toNamed(RouteNames.allCourses);
              },
              child: Text(
                'View All',
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() {
          return AlignedGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: controller.latestCourse.length,
            itemBuilder: (ctx, index) {
              final data = controller.latestCourse[index];
              return SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0.1,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.network(
                              height: 120,
                              width: double.infinity,
                              data.thumbnail ?? "",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox(
                                  height: 120,
                                  child: Center(
                                    child: Image.asset(
                                        'assets/images/logo.webp',
                                        fit: BoxFit.contain,
                                      ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    
                        GestureDetector(
                          onTap: () async{
                             await controller
                                          .getCourseDetails(data.id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, right: 8, left: 8, top: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 42,
                                  child: TextFormat.small(
                                    text: data.title ?? "",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Obx(
                                  ()=> authcontroller.user.value!.purchasedCourses!
                                        .any((course) => course.id == data.id)
                                    ? TextFormat.small(
                                        text: 'Purchased',
                                        textColor: AppColors.primary,
                                        fontWeight: FontWeight.w800,
                                      )
                                    : data.isFree ?? false
                                        ? TextFormat.small(
                                            text: 'Free',
                                            textColor: AppColors.primary,
                                            fontWeight: FontWeight.w800,
                                          )
                                        
                                        // :
                                        // data.priceWithDiscount != null
                                        //     ? Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment.spaceBetween,
                                        //         children: [
                                        //           TextFormat.small(
                                        //             text: 'Rs.${data.priceWithDiscount}',
                                        //             textColor: AppColors.primary,
                                        //             fontWeight: FontWeight.w800,
                                        //           ),
                                        //           TextFormat.small(
                                        //               text: 'Rs.${data.price}',
                                        //               decoration:
                                        //                   TextDecoration.lineThrough),
                                        //         ],
                                        //       )
                                        : TextFormat.small(
                                            text: 'Rs.${data.price}',
                                            textColor: AppColors.primary,
                                            fontWeight: FontWeight.w800,
                                          ),
                               
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primary, width: 1.5),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      child:
                                      authcontroller.user.value!.purchasedCourses!
                                        .any((course) => course.id == data.id) ? TextFormat.small(
                                        text: 'Continue',
                                         textColor: AppColors.primary,
                                              fontWeight: FontWeight.w800,
                                        ):
                                       data.isFree ?? false
                                          ? TextFormat.small(
                                              text: 'Enroll',
                                              textColor: AppColors.primary,
                                              fontWeight: FontWeight.w800,
                                            )
                                          : TextFormat.small(
                                              text: 'Buy Now',
                                              textColor: AppColors.primary,
                                              fontWeight: FontWeight.w800,
                                            ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          );
        }),
      ],
    );
  }
}

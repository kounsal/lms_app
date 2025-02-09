import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/controllers/home_controller.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/utils/config.dart';
import 'package:lms_app/utils/themes.dart';

class FeaturedCourseSection extends StatelessWidget {
  const FeaturedCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontroller = Get.find<AuthController>();

    final courseController = Get.put(CourseController());
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Courses',
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
        SizedBox(
          height: 130,
          child: Obx(() {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courseController.featuredCourses.length,
              itemBuilder: (context, index) {
                final data = courseController.featuredCourses[index];
                return Container(
                  margin: const EdgeInsets.only(right: 10),
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
                                data.thumbnail ?? "",
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
                                      data.title ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextFormat.extraSmall(
                                      text:
                                          'By ${data.teacher?.name ?? AppConfig.appName}',
                                      opacity: .5,
                                    ),
                                    data.isFree ?? false
                                        ? TextFormat.small(
                                            text: 'Free',
                                            textColor: AppColors.primary,
                                            fontWeight: FontWeight.w700)
                                        // : data.priceWithDiscount != null
                                        //     ? Row(
                                        //         children: [
                                        //           TextFormat.small(
                                        //               text:
                                        //                   'Rs.${data.priceWithDiscount}',
                                        //               textColor:
                                        //                   AppColors.primary,
                                        //               fontWeight:
                                        //                   FontWeight.w700),
                                        //           const SizedBox(
                                        //             width: 10,
                                        //           ),
                                        //           TextFormat.small(
                                        //               text: 'Rs.${data.price}',
                                        //               decoration: TextDecoration
                                        //                   .lineThrough),
                                        //         ],
                                        //       )
                                        : TextFormat.small(
                                            text: 'Rs.${data.price}',
                                            textColor: AppColors.primary,
                                            fontWeight: FontWeight.w700),
                                  ],
                                ),
                                Obx(() {
                                  return GestureDetector(
                                    onTap: () async {
                                      await courseController
                                          .getCourseDetails(data.id);
                                    },
                                    child: Container(
                                      width: constraints.maxWidth * .5,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.primary,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        child: Center(
                                          child: authcontroller
                                                  .user.value!.purchasedCourses!
                                                  .any((course) =>
                                                      course.id == data.id)
                                              ? TextFormat.small(
                                                  text: 'Purchased',
                                                  textColor: AppColors.primary,
                                                  fontWeight: FontWeight.w800,
                                                )
                                              : data.isFree ?? false
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.shopping_cart,
                                                          size: 20,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                        Text(
                                                          'Enroll Now',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.shopping_cart,
                                                          size: 20,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                        Text(
                                                          'Buy Now',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ))
                        ],
                      );
                    },
                  ),
                );
              },
            );
          }),
        )
      ],
    );
  }
}

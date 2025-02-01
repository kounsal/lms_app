import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/views/HomeScreen/widgets/category_section.dart';
import 'package:lms_app/views/HomeScreen/widgets/featured_course_section.dart';
import 'package:lms_app/views/HomeScreen/widgets/home_app_bar.dart';
import 'package:lms_app/views/HomeScreen/widgets/leatest_courses_section.dart';
import 'package:lms_app/views/HomeScreen/widgets/slider_section.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CourseController());
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: const Drawer(
        child: DrawerHeader(child: Text('Drawer Header')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height * .22,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: SafeArea(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeAppBar(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          children: [
                            SliderSection(),
                            CategorySection(),
                            FeaturedCourseSection(),
                            LatestCoursesSection(),
                          ],
                        ),
                      )
                    ],
                  )),
                ),
                controller.loadingCourseContent.value
                    ? Container(
                        width: size.width,
                        height: size.height,
                        color: Colors.black.withOpacity(.5),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          }),
        ),
      ),
    );
  }
}

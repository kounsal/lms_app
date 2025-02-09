import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/global_widgets/custom_app_bar.dart';
import 'widgets/my_course_grid.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  final controller = Get.put(CourseController());
  @override
  void initState() {
    super.initState();
    controller.getMyCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Obx(() {
        return 
        controller.myCourses.isEmpty
            ? const Center(
                child: Text('No courses Purchased yet'),
              )
            :
        SingleChildScrollView(
          child: AlignedGridView.count(
            padding: const EdgeInsets.all(10.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: controller.myCourses.length,
            itemBuilder: (ctx, index) {
              final course = controller.myCourses[index];
              return MyCourseGrid(
                course: course,
              );
            },
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
        );
      }),
    );
  }
}

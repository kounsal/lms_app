import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/models/single_course_model.dart';

class CourseDetailScreeen extends StatefulWidget {
  const CourseDetailScreeen({super.key});

  @override
  State<CourseDetailScreeen> createState() => _CourseDetailScreeenState();
}

class _CourseDetailScreeenState extends State<CourseDetailScreeen> {
  @override
  Widget build(BuildContext context) {
    SingleCourseModel course = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.network(course.thumbnail),
            Text(course.title),
            Text(course.description),
            Text(course.category),
          
          ],
        ),
      ),
    );
  }
}
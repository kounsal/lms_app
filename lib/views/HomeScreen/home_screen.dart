import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/core/services/auth_services.dart';
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
    final authControlleer = Get.find<AuthController>();
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
              ),
              accountEmail: Text(authControlleer.user.value?.email ?? "Guest"),
              accountName: Text(
                authControlleer.user.value?.fullname ?? "Guest",
                style: TextStyle(fontSize: 24.0),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Courses'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                authControlleer.logout();
                              },
                              child: Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('No')),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              SingleChildScrollView(
                  child: Stack(
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
                ],
              )),
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
    );
  }
}

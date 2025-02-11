import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/controllers/bottom_bar_controller.dart';
import 'package:lms_app/views/BottomBarView/profileCreateScreen.dart';

class BottomBarView extends StatelessWidget {
  const BottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController());
    final authcontroller = Get.find<AuthController>();
    return Obx(
      () {
        return authcontroller.user.value?.profileCreated ?? false?  Scaffold(
              body: controller.screens[controller.currentIndex.value],
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: controller.currentIndex.value,
                  onTap: (index) => controller.changeIndex(index),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: 'Bookmark',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.co_present_outlined),
                      label: 'My Course',
                    ),
                  ]),
            )
          
        : const CreateProfileScreen();
      }
    );
    
      
  }
}

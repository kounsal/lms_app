import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/splash_controller.dart';
import 'package:lms_app/utils/assets_manager.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Lottie.asset(AnimationManager.splash),
      ),
    );
  }
}

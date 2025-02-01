import 'dart:async';
import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/routes/route_names.dart';

class SplashController extends GetxController {
  final authController = Get.find<AuthController>();  
  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  navigate () {
    // Check user login and navigate
    Timer(const Duration(seconds: 5), () => authController.isLoggedIn.value
          ? Get.offAllNamed(RouteNames.home)
          : Get.offAllNamed(RouteNames.getStarted),);
  }
}
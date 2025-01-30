import 'dart:async';
import 'package:get/get.dart';
import 'package:lms_app/core/services/shared_services.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  navigate () {
    // Check user login and navigate
    Timer(const Duration(seconds: 5), SharedServices.checkLogin);
  }
}
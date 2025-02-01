import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/controllers/bottom_bar_controller.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/controllers/home_controller.dart';
import 'package:lms_app/controllers/login_controller.dart';
import 'package:lms_app/controllers/register_controller.dart';


class AllBindings extends Bindings {
  @override
  void dependencies() {
      Get.put(AuthController());
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => CourseController());
    Get.lazyPut(() => HomeController());
  
    // Get.lazyPut(() => LoginController());
    // Get.lazyPut(() => RegisterController());
  }

}
import 'package:get/get.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/models/category_model.dart';
import 'package:lms_app/models/course_model.dart';
import 'package:lms_app/models/coursee_model_new.dart';
import 'package:lms_app/models/user_model.dart';

class HomeController extends GetxController {
  final courseController = Get.put(CourseController());
  final UserModel user = UserModel();
  List<CategoryModel> categories = getCategories;
  // List<Course> featuredCourses = getFeaturedCourse;
  RxInt selectedSliderIndex = RxInt(0);
  changeSliderIndex(int index) {
    selectedSliderIndex.value = index;
    update();
  }
}

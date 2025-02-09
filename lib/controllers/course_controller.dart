import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/global_widgets/custom_alert.dart';
import 'package:lms_app/helpers/api_helper.dart';
import 'package:lms_app/models/coursee_model_new.dart';
import 'package:lms_app/models/lesson_model.dart';
import 'package:lms_app/models/plan_model.dart';
import 'package:lms_app/models/single_course_model.dart';
import 'package:lms_app/models/topic_model.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/app_urls.dart';
import 'package:lms_app/utils/assets_manager.dart';

class CourseController extends GetxController {
  RxList<Course> featuredCourses = <Course>[].obs;
  RxList<Course> allCourses = <Course>[].obs;
  RxList<Course> latestCourse = <Course>[].obs;
  RxList<PlanModel> plans = <PlanModel>[].obs;
  RxList<Course> myCourses = <Course>[].obs;
  RxInt expandedTileIndex = RxInt(-1);
  RxBool isLoading = false.obs;
  RxBool loadingCourseContent = false.obs;

  RxInt currentLessonIndex = RxInt(0);

  RxDouble overallCourseProgress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getFeaturedCourses();
    getLatestCourses();
  }
  Future<void> getFeaturedCourses ()
  async{
   try{
   var response = await ApiHelper.get(AppUrls.featured);
    if(response != null && response['Featured'] != null){
      print(response['Featured']);
      var featuredList = response['Featured'] as List;
      featuredCourses.value = featuredList.map((course) => Course.fromJson(course)).toList();
      update();
   }
   print(featuredCourses.length);
   }
    catch(e){
       print("Error fetching featured courses: $e");
    }
  }

  Future<void> getAllPlans () async {
    try{
      var response = await ApiHelper.get(AppUrls.plans);
      if(response != null && response['plans'] != null){
        print(response);
        var plansList = response['plans'] as List;
        plans.value = plansList.map((plan) => PlanModel.fromJson(plan)).toList();
        update();
      }
      print(plans.length);
    }
    catch(e){
      print("Error fetching plans: $e");
    }
  }
  Future<void> getAllCourses () async{
    try{
      var response = await ApiHelper.get(AppUrls.allcourses, );
      if(response != null && response != null){
        print(response);
        var allCoursesList = response as List;
        allCourses.value = allCoursesList.map((course) => Course.fromJson(course)).toList();
        update();
      }
      print(allCourses.length);
    }
    catch(e){
      print("Error fetching all courses: $e");
    }
  }
Future<void> getLatestCourses () async{
    try{
      var response = await ApiHelper.get(AppUrls.latest);
      if(response != null && response != null){
        print(response);
        var latestCoursesList = response as List;
        latestCourse.value = latestCoursesList.map((course) => Course.fromJson(course)).toList();
        update();
      }
      print(latestCourse.length);
    }
    catch(e){
      print("Error fetching latest courses: $e");
    }
}
Future<void> getCourseDetails(String courseId , ) async {
    loadingCourseContent.value = true;
    try {

      var response = await ApiHelper.get(AppUrls.courseDetails(courseId ), auth: true);
      if (response != null) {
        print(response);
        var courseContent = SingleCourseModel.fromJson(response);
       Get.toNamed(RouteNames.courseLearn, arguments: courseContent);
      }
      else{
        print(response.body);
      }
    } catch (e) {
      print("Error fetching course details: $e");
    } finally {
      loadingCourseContent.value = false;
    }
  }

Future<void> getMyCourses() async{
  // final AuthController authController = Get.find<AuthController>();  
    try{
      // authController.user.value!.purchasedCourses
      var response = await ApiHelper.get(AppUrls.mycourses , auth: true);
      if(response != null && response['courses'] != null){
        print("-----------------");
        print(response);
        var myCoursesList = response['courses'] as List;
        myCourses.value = myCoursesList.map((course) => Course.fromJson(course)).toList();
        update();
      }
      print(myCourses.length);
    }
    catch(e){
      print("Error fetching my courses: $e");
    }}



  // Function to handle expansion state
  void handleExpansion(int index) {
    // Update the expandedTileIndex
    expandedTileIndex.value = index;
    update();
    expandedTileIndex.refresh();
  }

  void nextLesson(List<Lesson>? lessons) {
    if (currentLessonIndex.value < lessons!.length - 1) {
      currentLessonIndex.value++;
      update();
    }
  }

  void previousLesson() {
    if (currentLessonIndex.value > 0) {
      currentLessonIndex.value--;
      update();
    }
  }

  void completeLesson(List<Lesson>? lessons, SingleCourseModel course) {
    lessons![currentLessonIndex.value].isCompleted = true;
    update();

    // Check if all lessons are completed
    if (allLessonsCompleted(lessons, course.topics)) {
      Get.dialog(
        CustomAlert(
          title: 'Congratulations!',
          description:
              'You have completed "${course.title}" course successfully',
          buttonText: 'Claim Certificate',
          image: AnimationManager.success,
          isAnimated: true,
          onButtonTap: () => Get.offAllNamed(RouteNames.home),
        ),
        barrierDismissible: false,
      );
    }
  }

  bool allLessonsCompleted(List<Lesson>? lessons, List<Topic>? topics) {
    return topics!.every(
      (topic) => topic.lessons.every(
        (lesson) => lesson.isCompleted,
      ),
    );
  }

  double calculateOverallCourseProgress(SingleCourseModel course) {
    if (course.topics == null || course.topics!.isEmpty) {
      return 0.0;
    }

    int totalLessons = 0;
    int completedLessons = 0;

    for (var topic in course.topics!) {
      if (topic.lessons.isNotEmpty) {
        totalLessons += topic.lessons.length;
        completedLessons +=
            topic.lessons!.where((lesson) => lesson.isCompleted).length;
      }
    }

    final progress = totalLessons > 0 ? completedLessons / totalLessons : 0.0;
    overallCourseProgress.value = progress;
    return progress;
  }
}

import 'package:get/get.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/views/Authentication/LoginScreen/login_screen.dart';
import 'package:lms_app/views/Authentication/RegisterScreen/register_screen.dart';
import 'package:lms_app/views/BookmarkScreen/bookmark_view_screen.dart';
import 'package:lms_app/views/BottomBarView/bottom_bar_view.dart';
import 'package:lms_app/views/GetStartedScreen/get_started_screen.dart';
import 'package:lms_app/views/HomeScreen/course_detail.dart';
import 'package:lms_app/views/LearningScreen/lesson_screen.dart';
import 'package:lms_app/views/SplashScreen/splash_screen.dart';
import 'package:lms_app/views/categories_screen.dart/all_books.dart';
import 'package:lms_app/views/categories_screen.dart/all_course.dart';
import 'package:lms_app/views/categories_screen.dart/free_videos.dart';
import 'package:lms_app/views/categories_screen.dart/quiz_screen.dart';
import 'package:lms_app/views/categories_screen.dart/test_series.dart';
import 'package:lms_app/views/payment/payment_view.dart';

import '../views/LearningScreen/learning_screen.dart';

class Routes {
  static List<GetPage> destination = [
    GetPage(name: RouteNames.initial, page: () => const SplashScreen()),
    GetPage(name: RouteNames.getStarted, page: () => const GetStartedScreen()),
    GetPage(name: RouteNames.login, page: () => const LoginScreen()),
    GetPage(name: RouteNames.register, page: () => const RegisterScreen()),
    GetPage(name: RouteNames.home, page: () => const BottomBarView()),
    GetPage(name: RouteNames.courseLearn, page: () => const LearningScreen()),
    GetPage(name: RouteNames.lesson, page: () => const LessonScreen()),
    GetPage(name: RouteNames.bookmarkPlayer, page: () => const BookmarkPlayerScreen()),
    GetPage(name: RouteNames.allCourses, page: ()=> const AllCourseScreen()),
    GetPage(name: RouteNames.freeVideos, page: ()=> FreeClassesScreen()),
    GetPage(name: RouteNames.quiz, page: ()=> QuizScreeen()),
    GetPage(name: RouteNames.testSeries, page: ()=> TestSeriesScreeen()),
    GetPage(name: RouteNames.books, page: ()=> AllBookScreen()),
    GetPage(name: RouteNames.courseDetails, page: ()=> CourseDetailScreeen()),
    // GetPage(name: RouteNames.paymentViewPage, page: ()=> PaymentViewPage()),
    
    
  ];

}


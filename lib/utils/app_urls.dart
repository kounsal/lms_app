import 'package:lms_app/utils/config.dart';

class AppUrls {
 
  static const String apiUrl = AppConfig.baseUrl;
  static Uri login = Uri.parse('$apiUrl/auth/login');
  static Uri register = Uri.parse('$apiUrl/auth/register');
  static Uri featured = Uri.parse('$apiUrl/courses/get-featured-courses');
  static Uri allcourses = Uri.parse('$apiUrl/courses/all');
  static Uri latest = Uri.parse('$apiUrl/courses/top-new-courses');
  static Uri plans = Uri.parse('$apiUrl/plan/');
  static Uri mycourses = Uri.parse('$apiUrl/courses/my-courses');
  
  static Uri courseDetails(String courseId) {
    return Uri.parse('$apiUrl/courses/one/$courseId');
  }
}
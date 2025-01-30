import 'package:lms_app/utils/config.dart';

class AppUrls {
 
  static const String apiUrl = AppConfig.baseUrl;
  static Uri login = Uri.parse('$apiUrl/auth/login');
  static Uri register = Uri.parse('$apiUrl/auth/register');
}
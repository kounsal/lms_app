import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lms_app/helpers/request_helpers.dart';
import 'package:lms_app/models/user_model.dart';
import 'package:lms_app/utils/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global_widgets/custom_alert.dart';
import '../../utils/assets_manager.dart';

class AuthServices {
  static Future<bool> register({
    required UserModel user,
  }) async {
    final pref = await SharedPreferences.getInstance();
    final request = await http
        .post(AppUrls.register, headers: RequestHelpers.header(), body: {
      'full_name': user.fullname,
      'email': user.email,
      // 'username': user.username,
      'password': user.password,
    });

    if (request.statusCode == 200) {
      pref.setString('token', jsonDecode(request.body)['response']['token']);
      pref.setString('name', user.fullname!);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> login({
    required UserModel user,
  }) async {
    final pref = await SharedPreferences.getInstance();
    print(user.email);
    print(user.password);
    print(jsonEncode({
      'email': user.email,
      'password': user.password,
    }));  
    print(AppUrls.login);
    final request = await http.post(AppUrls.login,   headers: {
    "Content-Type": "application/json",
    "Accept": "application/json",
  },
        body: jsonEncode({
          'email': user.email,
          'password': user.password,
        }));
    print(request.headers);

    if (request.statusCode == 200) {
      print(jsonDecode(request.body)['token']);
      pref.setString('token', jsonDecode(request.body)['token']);
      pref.setString('user', jsonEncode(jsonDecode(request.body)['user']));
      return true;
    } else {
      final decoded = jsonDecode(request.body);
      print(decoded);
      Get.dialog(
        CustomAlert(
          title: 'Error!',
          description: decoded['message'],
          buttonText: 'Try Again',
          image: AnimationManager.error,
          isAnimated: true,
        ),
        barrierDismissible: false,
      );
      return false;
    }
  }


}

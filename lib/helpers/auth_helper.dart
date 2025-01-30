import 'dart:convert';
import 'dart:math';

import 'package:lms_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static Future<String?> getToken () async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    return token;
  }

  static Future<String?> getName () async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString('name');
    return name;
  }
  static Future<UserModel?> getUser () async {
    final pref = await SharedPreferences.getInstance();
    final user = pref.getString('user');
   if(user != null){
     return UserModel.fromJson(jsonDecode(user));
   }
   else{
     return null;
   }
  }

  static Future removeToken () async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('token');
  }
}
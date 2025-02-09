import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/helpers/auth_helper.dart';

class ApiHelper {
  final controller = Get.find<AuthController>();

  static Future<dynamic> get(Uri url, {bool? auth}) async {
    try {
      String? token = await AuthHelper.getToken();
      print(token);
      print(auth);

      final response = await http.get(
        url,
        headers: auth ?? false
            ? {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                if (token != null) 'Authorization': 'Bearer $token',
              }
            : {},
      );
      print(response.body);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print(response.body);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> post(Uri url, dynamic body,
      {bool? auth}) async {
    String? token = await AuthHelper.getToken();
    print("jshshshshsh========= $token");
    try {
      final response = await http.post(url, body: body, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        if (token != null) 'Authorization': 'Bearer $token',
      });
      print(response.body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print(response.body);
        print(response.statusCode);
        throw Exception('Failed to load dataaaaaa');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data');
    }
  }

}

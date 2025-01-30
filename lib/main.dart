import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/bindings/all_bindings.dart';
import 'package:lms_app/routes/route_destinations.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/utils/config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AllBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
      ),
      getPages: Routes.destination,
      initialRoute: RouteNames.initial,
    );
  }
}

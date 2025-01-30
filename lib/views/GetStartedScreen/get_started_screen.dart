import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/global_widgets/custom_button.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/assets_manager.dart';
import 'package:lms_app/utils/themes.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageManager.getStarted),
              Column(
                children: [
                  TextFormat.bold(
                    text: 'Create your own\nstudy plan',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormat.small(
                    text:
                    'Study according to the\nstudy plan, make study\nmore motivated',
                    opacity: 0.5,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonTitle: 'Sign up',
                      onTap: () => Get.toNamed(RouteNames.register),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                      buttonTitle: 'Login',
                      isBorder: true,
                      onTap: () => Get.toNamed(RouteNames.login),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

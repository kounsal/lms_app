import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/controllers/login_controller.dart';
import 'package:lms_app/global_widgets/custom_button.dart';
import 'package:lms_app/helpers/form_helpers.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/assets_manager.dart';
import 'package:lms_app/utils/themes.dart';
import '../../../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Header Section
                  Column(
                    children: [
                      Image.asset(ImageManager.logo),
                      TextFormat.bold(text: 'Welcome Back!'),
                      TextFormat.small(
                        text: 'Login to continue',
                        textColor: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  Obx(() => Column(
                    children: [
                      // Login Form
                      Form(
                        // key: controller.globalKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              topLabelText: 'Your Email',
                              hintText: 'Enter your email',
                              prefixIcon: Icons.alternate_email,
                              isRequired: true,
                              errorText:
                              authController.validateEmail(authController.email.value),
                              onChanged: (value) {
                               authController.email.value = value;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextField(
                              topLabelText: 'Password',
                              hintText: 'Enter account password',
                              prefixIcon: Icons.password,
                              isRequired: true,
                              isSecured: true,
                              isLogin: true,
                              onChanged:  (value) => authController.password.value = value,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Forget Password Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextFormat.small(
                            text: 'Forget password?',
                            opacity: 0.5,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Login Button
                      CustomButton(
                        isLoading: authController.isLoading.value,
                        buttonTitle: 'Log In',
                        onTap: () {
                          // Check the form is valid or not
                          if (authController.validateEmail(authController.email.value) == null) {
                           authController.login();
                          }

                          // Otherwise it will trow an error message
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Create Account Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormat.small(
                            text: "Don't have an account?",
                            opacity: 0.5,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextFormat.small(
                            text: "Sign Up",
                            textColor: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            onTap: () => Get.toNamed(RouteNames.register),
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

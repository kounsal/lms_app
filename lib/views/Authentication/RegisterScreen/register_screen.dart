import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';
import 'package:lms_app/controllers/register_controller.dart';
import 'package:lms_app/global_widgets/custom_button.dart';
import 'package:lms_app/helpers/form_helpers.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/themes.dart';
import '../../../utils/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    // final controller = Get.put(RegisterController());
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
                      TextFormat.bold(text: 'Register Now!'),
                      TextFormat.small(
                        text: 'Fill the details below',
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
                                // CustomTextField(
                                //   topLabelText: 'Full Name',
                                //   hintText: 'Enter your full name',
                                //   prefixIcon: Icons.person_rounded,
                                //   isRequired: true,
                                //   onChanged: (p0) => controller.user.fullName = p0,
                                // ),
                                // const SizedBox(
                                //   height: 15,
                                // ),
                                CustomTextField(
                                  topLabelText: 'Username',
                                  hintText: 'Enter your username',
                                  prefixIcon: Icons.alternate_email,
                                  isRequired: true,
                                  onChanged: (p0) =>
                                      controller.user.value?.fullname = p0,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  topLabelText: 'Your Email',
                                  hintText: 'Enter your email',
                                  prefixIcon: Icons.email_rounded,
                                  isRequired: true,
                                  onChanged: (username) {
                                    controller.user.value?.email = username;
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
                                  onChanged: (p0) =>
                                      controller.user.value?.password = p0,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  topLabelText: 'Confirm Password',
                                  hintText: 'Re-type your password',
                                  prefixIcon: Icons.password,
                                  isRequired: true,
                                  isSecured: true,
                                  errorText: controller
                                          .confirmPassword.value.isNotEmpty
                                      ? 'Password mismatched'
                                      : null,
                                  onChanged: (p0) {
                                    controller.validateConfirmPassword(p0);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          // Login Button
                          CustomButton(
                            isLoading: controller.isLoading.value,
                            buttonTitle: 'Sign Up',
                            onTap: () {
                              if (controller.validateConfirmPassword(
                                          controller.password.value) ==
                                      null &&
                                  controller.validateEmail(
                                          controller.email.value) ==
                                      null &&
                                  controller.validatePassword(
                                          controller.password.value) ==
                                      null) {
                                controller.register();
                              }
                              // Check the form is valid or not
                              // if (controller.globalKey.currentState!
                              //     .validate()) {
                              //   if (controller.emailError.value.isEmpty &&
                              //       controller
                              //           .confirmPasswordError.value.isEmpty) {
                              //     controller.register();
                              //   }
                              // }
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
                                text: "Already have an account?",
                                opacity: 0.5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextFormat.small(
                                text: "Log In",
                                textColor: AppColors.primary,
                                fontWeight: FontWeight.w600,
                                onTap: () => Get.toNamed(RouteNames.login),
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

import 'package:get/get.dart';
import 'package:lms_app/helpers/auth_helper.dart';
import 'package:lms_app/models/user_model.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/core/services/auth_services.dart';
import '../global_widgets/custom_alert.dart';
import '../utils/assets_manager.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  Rxn<UserModel> user = Rxn<UserModel>();
  String? token;

  // Form fields
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  // Validators using GetX built-in validation
  String? validateEmail(String? value) {
    return GetUtils.isEmail(value ?? '') ? null : "Invalid email address";
  }

  String? validatePassword(String? value) {
    if ((value ?? '').length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != password.value) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    token = await AuthHelper.getToken();
    user.value = await AuthHelper.getUser();

  print(token);
  print(user.value?.toJson());
    if (token != null && user.value != null) {
      isLoggedIn.value = true;
      Get.offAllNamed(RouteNames.home);
    } else {
      Get.offAllNamed(RouteNames.getStarted);
    }
  }

  /// **Login Function**
  Future<void> login() async {
    isLoading.value = true;
    try {
      bool loginSuccess = await AuthServices.login(user: UserModel(email: email.value, password: password.value));
      if (loginSuccess) {
        token = await AuthHelper.getToken();
        user.value = await AuthHelper.getUser();
        isLoggedIn.value = true;
        Get.offAllNamed(RouteNames.home);
      } else {
        Get.snackbar("Login Failed", "Invalid credentials", snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading.value = false;
    }
  }

  /// **Register Function**
  Future<void> register() async {
    isLoading.value = true;
    try {
      bool isRegistered = await AuthServices.register(user: UserModel(email: email.value, password: password.value));
      if (isRegistered) {
        Get.dialog(
          CustomAlert(
            title: 'Congratulations',
            description: 'Registration successful!',
            buttonText: 'Continue',
            image: AnimationManager.success,
            isAnimated: true,
            onButtonTap: () => Get.offAllNamed(RouteNames.home),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.dialog(
          const CustomAlert(
            title: 'Error!',
            description: 'Registration failed!',
            buttonText: 'Try Again',
            image: AnimationManager.error,
            isAnimated: true,
          ),
          barrierDismissible: false,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  // /// **Logout Function**
  // Future<void> logout() async {
  //   await AuthHelper.clearAuthData();
  //   user.value = null;
  //   isLoggedIn.value = false;
  //   token = null;
  //   Get.offAllNamed(RouteNames.getStarted);
  // }
}

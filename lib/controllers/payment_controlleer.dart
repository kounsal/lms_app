import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';

import 'package:lms_app/helpers/api_helper.dart';
import 'package:lms_app/helpers/auth_helper.dart';
import 'package:lms_app/models/coursee_model_new.dart';
import 'package:lms_app/models/exam_model.dart';
import 'package:lms_app/models/purchase_model.dart';
import 'package:lms_app/models/razorPay_order_model.dart';
import 'package:lms_app/routes/route_names.dart';
import 'package:lms_app/utils/app_urls.dart';
import 'package:lms_app/utils/config.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  late Razorpay _razorpay;
  var isPaymentProcessing = false.obs;
  RxBool isPaymentSuccess = false.obs;
  final AuthController authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> makePayment(PurchaseModel purchase) async {
    isPaymentProcessing.value = true;

    try {
      var response = await ApiHelper.post(
          AppUrls.makePayment,
          jsonEncode({
            "Id": purchase.id,
            "type": purchase.type,
          }),
          auth: true);

      if (response['order'] == null) {
        throw Exception('Failed to create order');
      }
      var order = RazorPayOrderModel.fromJson(response['order']);

      var options = {
        'key': AppConfig.razorpayKey,
        'amount':
            (purchase.price * 100).toInt(), // Razorpay accepts amount in paise
        'currency': 'INR',
        'order_id': order.id,
        'name': AppConfig.appName,
        'description': 'Payment for ${purchase.name}',
        'prefill': {'contact': purchase.contact, 'email': purchase.email},
        'theme': {'color': '#3399cc'},
      };
      _razorpay.open(options);
    } catch (e) {
      print(e);
      isPaymentProcessing.value = false;
      Get.snackbar('Error', 'Payment failed: $e',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print(
        'Payment Success: ${response.paymentId}, ${response.signature} , ${response.orderId}');
    isPaymentProcessing.value = false;
    try {
      var res = await ApiHelper.post(
          AppUrls.verifyPaymet,
          jsonEncode({
            "razorpay_payment_id": response.paymentId,
            "razorpay_order_id": response.orderId,
            "razorpay_signature": response.signature,
          }),
          auth: true);
          print("---------rees--------");
          print(res);
          if(res['type']== 'exam'){
             
        if (res['exam'] is Map<String, dynamic>) { // Ensure it's a valid Map
            // print("Exam Data Found: $examData");
            print("Exam ID: ${res['exam']['id']}");
            authController.user.value!.purchasedExam?.add(ExamModel.fromJsonPay(res['exam']));
            // var dattest = ExamModel.fromJson(res['exam']);
            // print("Exam ID: ${dattest.id}");
        } else {
            print("Error: 'exam' is not a Map!");
        }
            }
            else if(res['type']== 'course'){
             authController.user.value!.purchasedCourses?.add(Course.fromJson(res['course']));
            }
          await AuthHelper.saveUser(authController.user.value!);
          Get.offAllNamed(RouteNames.home);
           Get.snackbar("Success", res['message'],
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
       

      isPaymentSuccess.value = true;
    } catch (e) {
        Get.offAllNamed(RouteNames.home);
      isPaymentSuccess.value = false;
      print(e);
    }
    
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    isPaymentProcessing.value = false;
    Get.snackbar('Error', 'Payment failed: ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar('Info', 'External Wallet selected: ${response.walletName}');
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}

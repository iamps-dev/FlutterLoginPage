import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/app_routes.dart';
import '../utils/snackbar_util.dart';

class ForgotPasswordController extends GetxController {
  final emailCtrl = TextEditingController();
  final isLoading = false.obs;
  final isEmailValid = false.obs;

  // ✅ Reset Password Logic
  Future<void> resetPassword(BuildContext context) async {
    if (!isEmailValid.value) {
      SnackbarUtil.showError(context, 'Please enter a valid email address');
      return;
    }

    try {
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;

      // Success message
      SnackbarUtil.showSuccess(context, 'Password reset link sent to your email');

      // Navigate back to login
      Get.offAllNamed(AppRoutes.login);

    } catch (e) {
      isLoading.value = false;
      SnackbarUtil.showError(context, 'Something went wrong. Please try again.');
    }
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    super.onClose();
  }
}

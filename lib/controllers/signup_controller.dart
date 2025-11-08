import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/snackbar_util.dart';
import '../app/app_routes.dart';

class SignUpController extends GetxController {
  // 🧠 Form Key
  final formKey = GlobalKey<FormState>();

  // 🧠 Text Controllers
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  // 🔐 Reactive variables
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final isLoading = false.obs;

  // 👁 Toggle Password visibility
  void togglePasswordVisibility() =>
      isPasswordHidden.value = !isPasswordHidden.value;

  void toggleConfirmPasswordVisibility() =>
      isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;

  // ✅ Field validations
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@') || !value.endsWith('.com')) {
      return 'Enter a valid email (must contain @ and end with .com)';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordCtrl.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // 📝 Register logic
  Future<void> register(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    // ✅ Success Snackbar (top)
    SnackbarUtil.showSuccess(context, 'Account created successfully!');

    // Navigate to login
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.onClose();
  }
}

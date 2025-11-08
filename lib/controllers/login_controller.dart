import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/snackbar_util.dart';

class LoginController extends GetxController {
  // 🧠 Form Key
  final formKey = GlobalKey<FormState>();

  // 🧠 Text Controllers
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  // 🔄 Reactive variables
  final isLoading = false.obs;
  final isPasswordHidden = true.obs;

  // 👁 Toggle Password visibility
  void togglePassword() => isPasswordHidden.value = !isPasswordHidden.value;

  // ✅ Email validation
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@') || !value.endsWith('.com')) {
      return 'Enter a valid email (must contain @ and end with .com)';
    }
    return null;
  }

  // ✅ Password validation
  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // 🧾 Login Logic
  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    SnackbarUtil.showSuccess(context, 'Login Successful!');

    emailCtrl.clear();
    passCtrl.clear();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.onClose();
  }
}

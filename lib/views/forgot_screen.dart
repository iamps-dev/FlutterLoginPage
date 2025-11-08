import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_controller.dart';
import '../widgets/TextFormFieldWgt.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ForgotPasswordController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE6CC), Color(0xFFFFA500)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.orangeAccent,
                        child: Icon(Icons.lock_reset_rounded,
                            color: Colors.white, size: 45),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Enter your registered email to receive a reset link',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      const SizedBox(height: 25),

                      // Email Field
                      TextFormFieldWgt(
                        maxlen: 50,
                        autofocus: true,
                        hinttext: 'Email',
                        controller: c.emailCtrl,
                        prxicon: Icons.email_outlined,
                        inptype: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            c.isEmailValid.value = false;
                            return "Enter email";
                          } else if (!v.contains('@') || !v.endsWith('.com')) {
                            c.isEmailValid.value = false;
                            return "Invalid email";
                          }
                          c.isEmailValid.value = true;
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),

                      // Send Reset Link Button
                      Obx(() => ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 6,
                        ),
                        onPressed: c.isLoading.value
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            c.resetPassword(context);
                          }
                        },
                        icon: const Icon(Icons.send_rounded),
                        label: c.isLoading.value
                            ? const SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2))
                            : const Text(
                          'Send Reset Link',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )),

                      const SizedBox(height: 25),
                      TextButton(
                        onPressed: () => Get.offAllNamed('/login'),
                        child: const Text(
                          "← Back to Login",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

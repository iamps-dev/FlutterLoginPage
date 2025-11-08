import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../widgets/TextFormFieldWgt.dart';
import '../app/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SignUpController());

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
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Form(
                  key: c.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.orangeAccent,
                        child: Icon(Icons.person_add_rounded,
                            color: Colors.white, size: 45),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Create Your Account',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      ),
                      const SizedBox(height: 25),

                      // Full Name
                      TextFormFieldWgt(
                        hinttext: 'Full Name',
                        controller: c.nameCtrl,
                        prxicon: Icons.person_outline,
                        validator: c.validateName,
                      ),
                      const SizedBox(height: 15),

                      // Email
                      TextFormFieldWgt(
                        hinttext: 'Email',
                        controller: c.emailCtrl,
                        prxicon: Icons.email_outlined,
                        inptype: TextInputType.emailAddress,
                        validator: c.validateEmail,
                      ),
                      const SizedBox(height: 15),

                      // Password
                      Obx(() => TextFormFieldWgt(
                        hinttext: 'Password',
                        maxline: 1,
                        controller: c.passwordCtrl,
                        prxicon: Icons.lock_outline,
                        obstxt: c.isPasswordHidden.value,
                        sfxicon: c.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onSficonTap: c.togglePasswordVisibility,
                        validator: c.validatePassword,
                      )),
                      const SizedBox(height: 15),

                      // Confirm Password
                      Obx(() => TextFormFieldWgt(
                        hinttext: 'Confirm Password',
                        maxline: 1,
                        controller: c.confirmPasswordCtrl,
                        prxicon: Icons.lock_outline,
                        obstxt: c.isConfirmPasswordHidden.value,
                        sfxicon: c.isConfirmPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onSficonTap: c.toggleConfirmPasswordVisibility,
                        validator: c.validateConfirmPassword,
                      )),
                      const SizedBox(height: 25),

                      // Sign Up Button
                      Obx(() => ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: c.isLoading.value
                            ? null
                            : () => c.register(context),
                        icon: const Icon(Icons.person_add_alt_1_rounded),
                        label: c.isLoading.value
                            ? const SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2))
                            : const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      const SizedBox(height: 25),

                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          TextButton(
                            onPressed: () => Get.toNamed(AppRoutes.login),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
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

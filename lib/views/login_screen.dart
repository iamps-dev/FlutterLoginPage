import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/app_routes.dart';
import '../controllers/login_controller.dart';
import '../widgets/TextFormFieldWgt.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LoginController());

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
                        child: Icon(Icons.lock_open_rounded,
                            color: Colors.white, size: 45),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Login to Your Account',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      ),
                      const SizedBox(height: 25),

                      // Email
                      TextFormFieldWgt(
                        maxlen: 50,
                        hinttext: 'Email',
                        controller: c.emailCtrl,
                        prxicon: Icons.email_outlined,
                        inptype: TextInputType.emailAddress,
                        validator: c.validateEmail,
                      ),
                      const SizedBox(height: 15),

                      // Password
                      Obx(() => TextFormFieldWgt(
                        maxlen: 20,
                        maxline: 1,
                        hinttext: 'Password',
                        controller: c.passCtrl,
                        prxicon: Icons.lock_outline,
                        obstxt: c.isPasswordHidden.value,
                        sfxicon: c.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onSficonTap: c.togglePassword,
                        validator: c.validatePassword,
                      )),
                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              Get.toNamed(AppRoutes.forgot),
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Login Button
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
                            : () => c.login(context),
                        icon: const Icon(Icons.login_rounded),
                        label: c.isLoading.value
                            ? const SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2))
                            : const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      const SizedBox(height: 25),

                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don’t have an account? "),
                          TextButton(
                            onPressed: () => Get.toNamed(AppRoutes.signup),
                            child: const Text(
                              "Sign Up",
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

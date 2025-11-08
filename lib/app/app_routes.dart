import 'package:get/get.dart';
import '../views/login_screen.dart';
import '../views/signup_screen.dart';
import '../views/forgot_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const forgot = '/forgot';

  static final pages = [
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignUpScreen()),
    GetPage(name: forgot, page: () => const ForgotPasswordScreen(),),
  ];
}

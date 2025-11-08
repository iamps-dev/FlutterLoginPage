import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Animation App',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.pages,
    );
  }
}

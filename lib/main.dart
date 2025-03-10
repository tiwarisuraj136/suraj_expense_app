import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suraj_expense_app/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.NAV_BAR,
      getPages: AppPages.routes,
    );
  }
}


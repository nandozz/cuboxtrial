import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Application",
      // home: SplashScreen(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

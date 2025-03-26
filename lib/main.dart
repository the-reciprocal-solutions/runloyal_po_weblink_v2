import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'app/routes/app_pages.dart';

void main() {
  // Use path URL strategy for web
  setUrlStrategy(PathUrlStrategy());

  // Enable skia shader warmup
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // Add these performance optimizations
      themeMode: ThemeMode.light,
      defaultTransition: Transition.fadeIn,
      opaqueRoute: true,
      enableLog: false,
    ),
  );
}

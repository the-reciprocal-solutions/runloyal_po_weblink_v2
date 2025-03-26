import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Use hash-based URLs for GitHub Pages compatibility
  setHashUrlStrategy();

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
      // Add routing configurations
      routingCallback: (routing) {
        if (routing?.current != null) {
          print('Current Route: ${routing?.current}');
        }
      },
      fallbackLocale: const Locale('en', 'US'),
      // Handle unknown routes
      unknownRoute: GetPage(
        name: '/404',
        page: () => const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        ),
      ),
      // Add these configurations for hash-based routing
      defaultGlobalState: true,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  );
}

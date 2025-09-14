import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/services/app_service.dart';
import 'package:flutter_clean_architecture/src/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      child: MaterialApp(
        key: AppService.appKey,
        navigatorKey: AppService.navigatorKey,
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.grey[100],
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

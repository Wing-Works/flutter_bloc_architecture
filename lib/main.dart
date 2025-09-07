import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/di/di.dart';
import 'package:flutter_clean_architecture/src/my_app/my_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(
    const ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      child: MyApp(),
    ),
  );
}

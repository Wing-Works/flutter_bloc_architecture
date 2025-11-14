import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/core/l10n/generated/l10n.dart';
import 'package:flutter_bloc_architecture/core/route/app_router.dart';
import 'package:flutter_bloc_architecture/core/services/app_service.dart';
import 'package:flutter_bloc_architecture/src/splash_screen/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate, // generated below
        ],
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.grey[100],
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

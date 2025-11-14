import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/di/di.dart';
import 'package:flutter_bloc_architecture/core/l10n/generated/l10n.dart';
import 'package:flutter_bloc_architecture/core/route/app_router.dart';
import 'package:flutter_bloc_architecture/core/services/app_service.dart';
import 'package:flutter_bloc_architecture/core/theme/theme.dart';
import 'package:flutter_bloc_architecture/src/my_app/cubit/theme_cubit.dart';
import 'package:flutter_bloc_architecture/src/splash/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeCubit>(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        child: BlocSelector<ThemeCubit, ThemeMode, ThemeMode>(
          selector: (s) => s,
          builder: (_, themeMode) {
            return MaterialApp(
              key: AppService.appKey,
              navigatorKey: AppService.navigatorKey,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate, // generated below
              ],
              supportedLocales: const [Locale('en', '')],
              theme: themeData,
              darkTheme: darkThemeData,
              themeMode: themeMode,
              initialRoute: SplashScreen.routeName,
              onGenerateRoute: onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}

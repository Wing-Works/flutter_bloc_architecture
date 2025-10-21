import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/core/di/di.dart';
import 'package:flutter_bloc_architecture/src/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_architecture/src/home/home_screen.dart';
import 'package:flutter_bloc_architecture/src/splash_screen/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return HomeScreen(getIt<HomeBloc>());
        },
      );
    default:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}

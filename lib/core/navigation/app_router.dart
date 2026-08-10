import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/core/di/di.dart';
import 'package:flutter_bloc_architecture/src/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_architecture/src/home/home_screen.dart';
import 'package:flutter_bloc_architecture/src/product_page/bloc/product_page_bloc.dart';
import 'package:flutter_bloc_architecture/src/product_page/product_page_screen.dart';
import 'package:flutter_bloc_architecture/src/settings/settings_screen.dart';
import 'package:flutter_bloc_architecture/src/splash/bloc/splash_bloc.dart';
import 'package:flutter_bloc_architecture/src/splash/splash_screen.dart';

/// Enhanced route generator with better error handling and type safety
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // Guard against null route names
  final routeName = settings.name;
  if (routeName == null) return _buildErrorRoute('Route name is null');

  // Route factory pattern for cleaner code
  try {
    return _buildRoute(routeName, settings.arguments);
  } catch (e) {
    debugPrint('Error generating route for $routeName: $e');
    return _buildErrorRoute('Failed to build route: $routeName');
  }
}

/// Centralized route building logic
Route<dynamic> _buildRoute(String routeName, Object? args) {
  switch (routeName) {
    case SplashScreen.routeName:
      return _createRoute(SplashScreen(getIt<SplashBloc>()));

    case HomeScreen.routeName:
      return _createRoute(
        HomeScreen(getIt<HomeBloc>()),
        settings: RouteSettings(name: routeName),
      );

    case ProductPageScreen.routeName:
      if (args is Map<String, dynamic>) {
        final productId = args['id'] as int? ?? 0;
        return _createRoute(
          ProductPageScreen(getIt<ProductPageBloc>(), productId: productId),
        );
      }
      // Fallback if arguments are missing/invalid
      debugPrint('Invalid arguments for ProductPageScreen: $args');
      return _buildErrorRoute('Invalid navigation arguments for product page');

    case SettingsScreen.routeName:
      return _createRoute(const SettingsScreen());

    default:
      return _buildErrorRoute('Unknown route: $routeName');
  }
}

/// Helper method to create MaterialPageRoute with consistent configuration
MaterialPageRoute<T> _createRoute<T>(
  Widget page, {
  RouteSettings? settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
}) {
  return MaterialPageRoute<T>(
    builder: (_) => page,
    settings: settings,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
  );
}

/// Error route with visual feedback
Route<dynamic> _buildErrorRoute(String message) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(title: const Text('Navigation Error')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Try to navigate back or to home
                },
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

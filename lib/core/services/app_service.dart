import 'package:flutter/material.dart';

abstract class AppService {
  const AppService._();

  static final GlobalKey<NavigatorState>? navigatorKey = GlobalKey(
    debugLabel: 'my-app-key',
  );

  static final GlobalKey<NavigatorState>? appKey = GlobalKey(
    debugLabel: 'appKey-app-key',
  );
}

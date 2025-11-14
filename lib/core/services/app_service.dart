import 'package:flutter/material.dart';

abstract class AppService {
  const AppService._();

  static final navigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'my-app-key',
  );

  static final appKey = GlobalKey<NavigatorState>(
    debugLabel: 'appKey-app-key',
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/core/di/di.dart';
import 'package:flutter_bloc_architecture/src/my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(const MyApp());
}

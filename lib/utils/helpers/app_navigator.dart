import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  static AppNavigator? _instance;
  GlobalKey<NavigatorState>? navigatorKey;

  static AppNavigator get instance => _instance ??= AppNavigator._();

  BuildContext get context => navigatorKey!.currentState!.context;
}

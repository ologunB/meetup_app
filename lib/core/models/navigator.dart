import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static final _navKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navKey => _navKey;
}

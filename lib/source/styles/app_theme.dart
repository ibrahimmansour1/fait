import 'package:fait/utils/shared_preferences_app.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeMode themeMode = AppSharedPreference.getThemeMode() == "dark"
      ? ThemeMode.dark
      : ThemeMode.light;
}

import 'package:fait/utils/shared_preferences_app.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = AppSharedPreference.getPrimaryColor() == "red"
      ? const Color(0xFFF84145)
      : AppSharedPreference.getPrimaryColor() == "green"
          ? const Color(0xFF6EBF97)
          : const Color(0xFF0072E1);

  static Color mainTextColor = AppSharedPreference.getThemeMode() == "dark"
      ? Colors.white
      : const Color(0xFF262626);
  static Color hintColor = const Color.fromRGBO(174, 174, 174, 1);
  static Color b2back = const Color.fromARGB(255, 230, 241, 252);
  static Color supportBack = const Color.fromRGBO(243, 243, 243, 1);
}

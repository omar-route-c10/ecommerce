import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData mainTheme = ThemeData(
    primaryColor: ColorsManager.primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorsManager.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: ColorsManager.whiteColor,
      ),
    ),
  );
}

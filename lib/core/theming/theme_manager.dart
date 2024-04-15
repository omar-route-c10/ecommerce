import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData mainTheme = ThemeData(
    primaryColor: ColorsManager.primary,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: ColorsManager.primary,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: ColorsManager.darkPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primary,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorsManager.white,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemesUtil {
  ThemeMode currentTheme = ThemeMode.light;
  getTheme() => currentTheme;
  setTheme(ThemeMode themeMode) {
    currentTheme = themeMode;
    Get.changeThemeMode(themeMode);
  }

  switchTheme() {
    if (Get.isDarkMode) {
      currentTheme = ThemeMode.light;
      Get.changeThemeMode(ThemeMode.light);
    } else {
      currentTheme = ThemeMode.dark;
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  static final light = ThemeData(
    useMaterial3: true,
    fontFamily: "Acumin Pro",
    colorScheme: const ColorScheme.light(
      surfaceDim: Color(0xFF4000BF),
      surfaceBright: Color(0xFF111036),
      onSurface: Color(0xFFFFFFFF),
      primary: Color(0xFF703CFE),
      primaryFixed: Color(0xFF3300BF),
      secondary: Color(0xFF00DAFF),
      secondaryFixed: Color(0xFF0058A1),
      primaryContainer: Color(0xFF140F3F),
      surfaceContainer: Color(0xFF4701ED),
      secondaryContainer: Color(0xFF160C34),
      outline: Color(0xFFAD8FFC),
      surfaceContainerLow: Color(0xFFFF569D),
      surfaceContainerHigh: Color(0xFFCC0A60),
      outlineVariant: Color(0xFFFF7BC4),
      scrim: Color(0xFF1FCD1F),
      surfaceTint: Color(0xFF007508),
      tertiary: Color(0xFFFFE100),
      tertiaryFixed: Color(0xFFFD731A),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xFF0F1011),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFF8F8F9),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Color(0xFFA4AAB1),
      unselectedItemColor: Color(0xFFA4AAB1),
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      headerForegroundColor: Color(0xFF0F1011),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      yearForegroundColor: WidgetStatePropertyAll(Color(0xFF0F1011)),
      dividerColor: Color(0xFFA4AAB1),
    ),
  );
}

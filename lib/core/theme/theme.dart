import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/core/util/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get themeData {
  return ThemeData(
    useMaterial3: true,
    appBarTheme: appBarTheme.copyWith(
      backgroundColor: ColorConstant.kPrimaryColor,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    primaryColor: ColorConstant.kPrimaryColor,
    scaffoldBackgroundColor: ColorConstant.kScaffold,
    colorScheme: const ColorScheme.light(
      primary: ColorConstant.kPrimaryColor,
      secondary: ColorConstant.kSecondaryLightColor,
      onSecondary: ColorConstant.kBodyTextColorLight,
      onSurface: ColorConstant.kTitleTextLightColor,
    ),
    iconTheme: const IconThemeData(color: ColorConstant.kBodyTextColorLight),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorConstant.kPrimaryColor,
      foregroundColor: ColorConstant.kAccentIconLightColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: ColorConstant.kPrimaryIconLightColor,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstant.kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorConstant.kPrimaryColor;
        }
        return Colors.grey;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorConstant.kPrimaryColor.withAlpha(50);
        }
        return Colors.grey.withAlpha(30);
      }),
    ),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyLarge: const TextStyle(color: ColorConstant.kBodyTextColorLight),
      bodyMedium: const TextStyle(color: ColorConstant.kBodyTextColorLight),
      headlineMedium: const TextStyle(
        color: ColorConstant.kTitleTextLightColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: const TextStyle(
        color: ColorConstant.kTitleTextLightColor,
        fontSize: 80,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

ThemeData get darkThemeData {
  return ThemeData.dark().copyWith(
    primaryColor: ColorConstant.kPrimaryColor,
    scaffoldBackgroundColor: const Color(0xFF0D0C0E),
    appBarTheme: appBarTheme.copyWith(
      backgroundColor: ColorConstant.kSurfaceDarkColor,
      foregroundColor: ColorConstant.kTitleTextDarkColor,
      iconTheme: const IconThemeData(color: ColorConstant.kTitleTextDarkColor),
    ),
    colorScheme: const ColorScheme.dark(
      primary: ColorConstant.kPrimaryColor,
      secondary: ColorConstant.kSecondaryDarkColor,
      surface: ColorConstant.kSurfaceDarkColor,
      onPrimary: Colors.white,
      onSecondary: ColorConstant.kBodyTextColorDark,
    ),
    iconTheme: const IconThemeData(color: ColorConstant.kBodyTextColorDark),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorConstant.kPrimaryColor,
      foregroundColor: ColorConstant.kAccentIconDarkColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: ColorConstant.kPrimaryIconDarkColor,
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: ColorConstant.kSurfaceDarkColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstant.kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorConstant.kPrimaryColor;
        }
        return Colors.grey[400];
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorConstant.kPrimaryColor.withAlpha(50);
        }
        return Colors.grey.withAlpha(30);
      }),
    ),
    textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).copyWith(
      bodyLarge: const TextStyle(color: ColorConstant.kBodyTextColorDark),
      bodyMedium: const TextStyle(color: ColorConstant.kBodyTextColorDark),
      headlineMedium: const TextStyle(
        color: ColorConstant.kTitleTextDarkColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: const TextStyle(
        color: ColorConstant.kTitleTextDarkColor,
        fontSize: 80,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

const appBarTheme = AppBarTheme(elevation: 0, centerTitle: true);

import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/core/theme/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get themeData {
  return ThemeData(
    useMaterial3: true,
    appBarTheme: appBarTheme.copyWith(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryLightColor,
      surface: Colors.white,
      background: Colors.white,
      onPrimary: Colors.white,
      onSecondary: kBodyTextColorLight,
      onSurface: kTitleTextLightColor,
    ),
    iconTheme: const IconThemeData(color: kBodyTextColorLight),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kPrimaryColor,
      foregroundColor: kAccentIconLightColor,
    ),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconLightColor),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return Colors.grey;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor.withOpacity(0.5);
        }
        return Colors.grey.withOpacity(0.3);
      }),
    ),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyLarge: const TextStyle(color: kBodyTextColorLight),
      bodyMedium: const TextStyle(color: kBodyTextColorLight),
      headlineMedium: const TextStyle(
        color: kTitleTextLightColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: const TextStyle(
        color: kTitleTextLightColor,
        fontSize: 80,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

ThemeData get darkThemeData {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: const Color(0xFF0D0C0E),
    appBarTheme: appBarTheme.copyWith(
      backgroundColor: kSurfaceDarkColor,
      foregroundColor: kTitleTextDarkColor,
      iconTheme: const IconThemeData(color: kTitleTextDarkColor),
    ),
    colorScheme: const ColorScheme.dark(
      primary: kPrimaryColor,
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
      background: kBackgroundDarkColor,
      onPrimary: Colors.white,
      onSecondary: kBodyTextColorDark,
      onSurface: kTitleTextDarkColor,
      onBackground: kTitleTextDarkColor,
    ),
    iconTheme: const IconThemeData(color: kBodyTextColorDark),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kPrimaryColor,
      foregroundColor: kAccentIconDarkColor,
    ),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconDarkColor),
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: kSurfaceDarkColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return Colors.grey[400];
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor.withOpacity(0.5);
        }
        return Colors.grey.withOpacity(0.3);
      }),
    ),
    textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).copyWith(
      bodyLarge: const TextStyle(color: kBodyTextColorDark),
      bodyMedium: const TextStyle(color: kBodyTextColorDark),
      headlineMedium: const TextStyle(
        color: kTitleTextDarkColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: const TextStyle(
        color: kTitleTextDarkColor,
        fontSize: 80,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

const appBarTheme = AppBarTheme(
  elevation: 0,
  centerTitle: true,
);

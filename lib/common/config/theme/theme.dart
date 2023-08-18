// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class TripAdvisorTheme {
  static ThemeData get light {
    return ThemeData(useMaterial3: true);
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      hintColor: Colors.grey,
      disabledColor: Colors.grey.shade700,
      primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w900,
        ),
        displayMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          overflow: TextOverflow.clip,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w300,
        ),
      ),
      primaryColor: Colors.black87,
      primaryColorDark: Colors.black12,
      primaryColorLight: Colors.white,
      colorScheme: const ColorScheme.dark(
        secondaryContainer: Colors.black12,
        tertiary: Colors.lightGreenAccent,
        tertiaryContainer: Color(0xFF235347),
        onError: Colors.red,
        onPrimary: Colors.white,
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.grey,
        thickness: 0.4,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
      ),
    );
  }
}

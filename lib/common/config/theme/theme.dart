// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class TripAdvisorTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
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
        // used in titles on Account, review, plan trips screen
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w900,
        ),
        displayMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),

        // used in imageContainer widget in review screen
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          overflow: TextOverflow.clip,
        ),

        // used for version, device id in account screen
        displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w300,
        ),
      ),
      // main bg color of app
      primaryColor: Colors.black87,
      // bg color of buttons
      primaryColorDark: Colors.black12,
      // border color of buttons when bg color is black
      primaryColorLight: Colors.white,
      colorScheme: const ColorScheme.dark(
        secondaryContainer: Colors.black12,
        // used in bottom bar above active item
        tertiary: Colors.lightGreenAccent,
        // used in trips tab in plan_trip screen
        tertiaryContainer: Color(0xFF235347),
        // used when there is error in validation in text field
        onError: Colors.red,
        // used in text field when there is no error
        onPrimary: Colors.white,
      ),
      dividerTheme: const DividerThemeData(color: Colors.grey, thickness: 0.4),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
      ),
    );
  }
}

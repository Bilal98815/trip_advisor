// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:trip_advisor/common/constants/constants.dart';

class TripAdvisorTheme {
  static TextTheme textTheme = const TextTheme(
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),

    bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
    bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),

    labelSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    //used in onboarding buttons
    labelMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),

    //used in primary buttons
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),

    displayMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),

    // used in imageContainer widget in review screen
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.clip,
    ),
  );

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: kWhite,
        iconTheme: IconThemeData(color: kBlack, size: 20),
        titleTextStyle: TextStyle(
          color: kBlack,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
      ),
      hintColor: kDarkGrey,
      disabledColor: kGrey,
      textTheme: textTheme,
      iconTheme: const IconThemeData(
        color: kBlack,
        size: 18,
      ),
      colorScheme: const ColorScheme.light(
        primary: kDarkPurple,
        secondary: kBrightGreen,
        tertiary: kDarkGrey,
        primaryContainer: kLightGrey,
        onPrimaryContainer: kDarkGrey,
        secondaryContainer: kLighterDarkGreen,
        onSecondaryContainer: kShadedRed,
        tertiaryContainer: kGreen,
        onTertiaryContainer: kGrey,
        error: kRed,
        onBackground: kBlack,
        outline: kGrey,
      ),
      dividerTheme: const DividerThemeData(color: kGrey, thickness: 0.4),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kLightGrey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kBlack,
        unselectedItemColor: kDarkGrey.withOpacity(0.7),
      ),
      tabBarTheme: const TabBarTheme(
        dividerColor: kTransparent,
        indicatorColor: kBlack,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: kBlack,
        iconTheme: IconThemeData(color: kWhite, size: 20),
        titleTextStyle: TextStyle(
          color: kWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      hintColor: kGrey,
      disabledColor: kDarkGrey,
      textTheme: textTheme,
      iconTheme: const IconThemeData(
        color: kWhite,
        size: 18,
      ),
      colorScheme: const ColorScheme.dark(
        background: kBlack,
        primary: kPurple,
        secondary: kLightGreen,
        tertiary: kGrey,
        primaryContainer: kDarkerGrey,
        onPrimaryContainer: kLightGrey,
        secondaryContainer: kDarkGreen,
        onSecondaryContainer: kShadedRed,
        tertiaryContainer: kGreen,
        onTertiaryContainer: kGrey,
        error: kRed,
        onError: kWhite,
        onPrimary: kWhite,
        outline: kDarkGrey,
      ),
      dividerTheme: const DividerThemeData(color: kGrey, thickness: 0.4),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kDarkerGrey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kWhite,
        unselectedItemColor: kGrey.withOpacity(0.7),
      ),
      tabBarTheme: const TabBarTheme(
        dividerColor: kTransparent,
        indicatorColor: kWhite,
      ),
    );
  }
}

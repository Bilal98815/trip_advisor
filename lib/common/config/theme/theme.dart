// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:trip_advisor/common/constants/constants.dart';

class TripAdvisorTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: kWhite,
        iconTheme: IconThemeData(color: kBlack),
        titleTextStyle: TextStyle(
          color: kBlack,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      hintColor: kGrey,
      disabledColor: kDarkGrey,
      textTheme: const TextTheme(
        // used in titles on Account, review, plan trips screen
        titleLarge: TextStyle(
          color: kBlack,
          fontSize: 32,
          fontWeight: FontWeight.w900,
        ),
        displayMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),

        // used in imageContainer widget in review screen
        displayLarge: TextStyle(
          color: kWhite,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          overflow: TextOverflow.clip,
        ),

        // used for version, device id in account screen
        bodySmall: TextStyle(
          color: kBlack,
          fontSize: 11,
          fontWeight: FontWeight.w300,
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: kBrightGreen,
        primaryContainer: kDarkGreen,
        error: kRed,
      ),
      dividerTheme: const DividerThemeData(color: kGrey, thickness: 0.4),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kWhite,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kBlack,
        unselectedItemColor: kDarkGrey.withOpacity(0.7),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: kBlack,
        iconTheme: IconThemeData(color: kWhite),
        titleTextStyle: TextStyle(
          color: kWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      hintColor: kGrey,
      disabledColor: kDarkGrey,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: kWhite,
          fontSize: 32,
          fontWeight: FontWeight.w900,
        ),

        titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),

        bodySmall: TextStyle(
          color: kWhite,
          fontSize: 11,
          fontWeight: FontWeight.w300,
        ),

        labelMedium: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),

        displayMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),

        // used in imageContainer widget in review screen
        displayLarge: TextStyle(
          color: kWhite,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          overflow: TextOverflow.clip,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        background: kBlack,
        primary: kLightGreen,
        secondaryContainer: kDarkGreen,
        error: kRed,
        onPrimary: kWhite,

        //see what this is
        primaryContainer: kDarkerGrey,
      ),
      dividerTheme: const DividerThemeData(color: kGrey, thickness: 0.4),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kBlack,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kWhite,
        unselectedItemColor: kGrey.withOpacity(0.7),
      ),
    );
  }
}

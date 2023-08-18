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
      ),
    );
  }
}

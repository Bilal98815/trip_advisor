import 'package:flutter/material.dart';

class IconTab {
  const IconTab({
    required this.index,
    required this.label,
    required this.icon,
    required this.location,
  });

  final int index;
  final String label;
  final IconData icon;
  final String location;
}

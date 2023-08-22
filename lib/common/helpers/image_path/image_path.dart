import 'package:flutter/material.dart';

class ImagePath {
  String getPathByTheme(BuildContext context, String image) {
    final Brightness brightness = Theme.of(context).brightness;
    final themeModeFolder = brightness == Brightness.light ? 'light' : 'dark';
    return 'assets/images/$themeModeFolder/$image';
  }
}

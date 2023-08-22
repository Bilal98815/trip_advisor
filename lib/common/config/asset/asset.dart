import 'package:flutter/material.dart';

class Asset extends InheritedWidget {
  const Asset({super.key, required this.child}) : super(child: child);

  @override
  final Widget child;

  static BuildContext? buildcontext;

  static Asset of(BuildContext context) {
    buildcontext = context;
    return context.dependOnInheritedWidgetOfExactType<Asset>()!;
  }

  String _getImagePath(String imageName) {
    final Brightness brightness = Theme.of(buildcontext!).brightness;
    final themeModeFolder = brightness == Brightness.light ? 'light' : 'dark';
    return 'assets/images/$themeModeFolder/$imageName';
  }

  String get invoice => _getImagePath('invoice.png');

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

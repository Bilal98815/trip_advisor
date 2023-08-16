import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EasyLocalizationPackage extends StatelessWidget {
  const EasyLocalizationPackage({
    super.key,
    required this.supportedLocales,
    required this.path,
    required this.fallbackLocale,
    required this.startLocale,
    required this.child,
  });

  final List<Locale> supportedLocales;
  final String path;
  final Locale fallbackLocale;
  final Locale startLocale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: path,
      fallbackLocale: fallbackLocale,
      startLocale: startLocale,
      child: child,
    );
  }
}

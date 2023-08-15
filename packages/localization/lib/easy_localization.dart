import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

void initializeLocalization({required Widget app}) async {
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        child: app,
        supportedLocales: [Locale('en', 'US'), Locale('en', 'GB')],
        fallbackLocale: Locale('en', 'US'),
        path: 'assets/translations'),
  );
}

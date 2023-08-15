import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class Localization {
  final supportedLocales = const [Locale('en', 'US'), Locale('en', 'GB')];

  List<LocalizationsDelegate<dynamic>> localizationDelegates(
      BuildContext context) {
    return context.localizationDelegates;
  }

  Locale locale(BuildContext context) {
    return context.locale;
  }

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
}

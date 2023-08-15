import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class Localization {
  final supportedLocales = const [Locale('en', 'US'), Locale('en', 'GB')];

  List<LocalizationsDelegate<dynamic>> localizationDelegates(
      BuildContext context) {
    debugPrint('In localization delegates');
    return context.localizationDelegates;
  }

  Locale locale(BuildContext context) {
    debugPrint('In locale');
    return context.locale;
  }

  String translation(String key) {
    debugPrint('In translation method');
    return key.tr();
  }

  void initializeLocalization({required Widget app}) async {
    await EasyLocalization.ensureInitialized();
    runApp(
      EasyLocalization(
        child: app,
        supportedLocales: [Locale('en', 'US'), Locale('en', 'GB')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
      ),
    );
  }
}

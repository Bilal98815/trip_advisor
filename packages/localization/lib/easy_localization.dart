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
    debugPrint('Locale: -------->>>> ${context.locale}');
    return context.locale;
  }

  String translation(String key) {
    return key.tr();
  }

  String argumentTextTranslation(
      String key, String namedArgument, String argumentText) {
    return key.tr(namedArgs: {namedArgument: argumentText});
  }

  void initializeLocalization({required Widget app}) async {
    await EasyLocalization.ensureInitialized();
    runApp(
      EasyLocalization(
        child: app,
        supportedLocales: [Locale('en', 'US'), Locale('en', 'GB')],
        path: 'packages/localization/assets/translations',
        fallbackLocale: Locale('en', 'US'),
      ),
    );
  }
}

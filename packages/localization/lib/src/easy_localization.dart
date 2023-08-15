part of 'localization.dart';

class EasyLocalizationPackage extends Localization {
  static final List<Locale> supported = const [
    Locale('en', 'US'),
    Locale('en', 'GB')
  ];

  List<Locale> get supportedLocales => supported;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }

  static EasyLocalization createLocalizationWidget({required Widget child}) {
    return EasyLocalization(
      supportedLocales: supported,
      path: 'packages/localization/assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: child,
    );
  }

  List<LocalizationsDelegate<dynamic>> localizationDelegates(
    BuildContext context,
  ) {
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
}

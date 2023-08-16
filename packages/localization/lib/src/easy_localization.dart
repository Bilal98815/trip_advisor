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
    return context.localizationDelegates;
  }

  Locale locale(BuildContext context) {
    return context.locale;
  }

  String translation(String key) {
    return key.tr();
  }

  String argumentTextTranslation(
    String key,
    String namedArgument,
    String argumentText,
  ) {
    return key.tr(namedArgs: {namedArgument: argumentText});
  }

  void setLocale(BuildContext context, {required Locale locale}) {
    context.setLocale(locale);
  }
}

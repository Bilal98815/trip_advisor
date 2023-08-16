import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

part 'easy_localization.dart';

abstract class Localization {
  List<LocalizationsDelegate<dynamic>> localizationDelegates(
    BuildContext context,
  );

  List<Locale> get supportedLocales;

  Locale locale(BuildContext context);
  void setLocale(BuildContext context, {required Locale locale});

  String translation(String key);

  String argumentTextTranslation(
    String key,
    String namedArgument,
    String argumentText,
  );
}

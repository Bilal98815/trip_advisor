part of 'models.dart';

class Language {
  Language({
    required this.name,
    required this.localizedName,
    required this.locale,
  });

  final String name;
  final String localizedName;
  final Locale locale;
}

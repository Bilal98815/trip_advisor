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

  static Language fromJson(Map<String, dynamic> json) => Language(
        locale: json['locale'] != null
            ? Locale.fromSubtags(
                languageCode: (json['locale'] as String).split('-')[0],
                countryCode: (json['locale'] as String).split('-')[1],
              )
            : kStartingLocale,
        localizedName: json['localizedName'] as String? ?? '',
        name: json['name'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'locale': locale.toLanguageTag(),
        'localizedName': localizedName,
        'name': name,
      };
}

part of 'models.dart';

class PreferenceSettings extends Equatable {
  const PreferenceSettings({
    required this.locale,
    required this.currency,
    required this.units,
  });

  final Locale locale;
  final String currency;
  final String units;

  static PreferenceSettings fromJson(Map<String, dynamic> json) =>
      PreferenceSettings(
        locale: json['locale'] != null
            ? Locale.fromSubtags(
                languageCode: (json['locale'] as String).split('-')[0],
                countryCode: (json['locale'] as String).split('-')[1],
              )
            : kStartingLocale,
        currency: json['currency'] as String? ?? '',
        units: json['units'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'locale': locale.toLanguageTag(),
        'currency': currency,
        'units': units,
      };

  PreferenceSettings copyWith({
    Locale? locale,
    String? currency,
    String? units,
  }) {
    return PreferenceSettings(
      locale: locale ?? this.locale,
      currency: currency ?? this.currency,
      units: units ?? this.units,
    );
  }

  @override
  List<Object?> get props => [locale, currency, units];
}

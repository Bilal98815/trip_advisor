part of 'models.dart';

class PreferenceSettings extends Equatable {
  const PreferenceSettings({
    this.language = Languages.englishUK,
    this.currency = Currencies.usDollars,
    this.units = '',
  });

  final Languages language;
  final Currencies currency;
  final String units;

  static PreferenceSettings fromJson(Map<String, dynamic> json) =>
      PreferenceSettings(
        language:
            Languages.values.byName(json['language'] as String? ?? 'englishUK'),
        currency: Currencies.values
            .byName(json['currency'] as String? ?? 'usDollars'),
        units: json['units'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'language': language,
        'currency': currency,
        'units': units,
      };

  PreferenceSettings copyWith({
    Languages? language,
    Currencies? currency,
    String? units,
  }) {
    return PreferenceSettings(
      language: language ?? this.language,
      currency: currency ?? this.currency,
      units: units ?? this.units,
    );
  }

  @override
  List<Object?> get props => [language, currency, units];
}

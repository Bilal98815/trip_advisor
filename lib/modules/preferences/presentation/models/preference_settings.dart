part of 'models.dart';

class PreferenceSettings extends Equatable {
  const PreferenceSettings({
    required this.language,
    required this.currency,
    required this.units,
  });

  final Languages language;
  final String currency;
  final String units;

  static PreferenceSettings fromJson(Map<String, dynamic> json) =>
      PreferenceSettings(
        language:
            Languages.values.byName(json['language'] as String? ?? 'englishUK'),
        currency: json['currency'] as String? ?? '',
        units: json['units'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'language': language,
        'currency': currency,
        'units': units,
      };

  PreferenceSettings copyWith({
    Languages? language,
    String? currency,
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

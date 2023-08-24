part of 'preferences_bloc.dart';

class PreferencesState extends Equatable {
  const PreferencesState({
    this.language = Languages.englishUK,
    this.currency = '',
    this.units = '',
  });

  final Languages language;
  final String currency;
  final String units;

  PreferencesState copyWith({
    Languages? language,
    String? currency,
    String? units,
  }) {
    return PreferencesState(
      language: language ?? this.language,
      currency: currency ?? this.currency,
      units: units ?? this.units,
    );
  }

  @override
  List<Object> get props => [language, currency, units];
}

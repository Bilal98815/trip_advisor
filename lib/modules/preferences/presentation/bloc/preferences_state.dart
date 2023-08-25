part of 'preferences_bloc.dart';

class PreferencesState extends Equatable {
  const PreferencesState({
    this.language = Languages.englishUK,
    this.currency = Currencies.usDollars,
    this.units = Units.imperial,
  });

  final Languages language;
  final Currencies currency;
  final Units units;

  PreferencesState copyWith({
    Languages? language,
    Currencies? currency,
    Units? units,
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

part of 'preferences_bloc.dart';

class PreferencesState extends Equatable {
  PreferencesState({
    Language? language,
    this.currency = '',
    this.units = '',
  }) : language = language ??
            Language(
              name: 'English (United Kingdom)',
              localizedName: LocaleStrings.languageEnglishUK,
              locale: kSupportedLocales[0],
            );

  final Language language;
  final String currency;
  final String units;

  PreferencesState copyWith({
    Language? language,
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

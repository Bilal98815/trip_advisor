part of 'preferences_bloc.dart';

class PreferencesState extends Equatable {
  const PreferencesState({
    this.locale = kStartingLocale,
    this.currency = '',
    this.units = '',
  });

  final Locale locale;
  final String currency;
  final String units;

  PreferencesState copyWith({Locale? locale, String? currency, String? units}) {
    return PreferencesState(
      locale: locale ?? this.locale,
      currency: currency ?? this.currency,
      units: units ?? this.units,
    );
  }

  @override
  List<Object> get props => [locale, currency, units];
}

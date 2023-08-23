part of 'language_preferences_bloc.dart';

class LanguagePreferencesState extends Equatable {
  const LanguagePreferencesState({required this.selectedLocale});

  final Locale selectedLocale;

  LanguagePreferencesState copyWith({Locale? selectedLocale}) {
    return LanguagePreferencesState(
      selectedLocale: selectedLocale ?? this.selectedLocale,
    );
  }

  @override
  List<Object> get props => [selectedLocale];
}

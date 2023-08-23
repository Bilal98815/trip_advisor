part of 'language_preferences_bloc.dart';

abstract class LanguagePreferencesEvent {}

class LanguagePreferencesLocaleChanged extends LanguagePreferencesEvent {
  LanguagePreferencesLocaleChanged(this.locale);
  final Locale locale;
}

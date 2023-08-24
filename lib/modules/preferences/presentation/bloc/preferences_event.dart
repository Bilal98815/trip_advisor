part of 'preferences_bloc.dart';

abstract class PreferencesEvent {}

class PreferencesGetPreferences extends PreferencesEvent {}

class PreferencesLocaleChanged extends PreferencesEvent {
  PreferencesLocaleChanged(this.locale);
  final Locale locale;
}

part of 'preferences_bloc.dart';

abstract class PreferencesEvent {}

class PreferencesGetPreferences extends PreferencesEvent {}

class PreferencesLanguageChanged extends PreferencesEvent {
  PreferencesLanguageChanged(this.language);
  final Languages language;
}

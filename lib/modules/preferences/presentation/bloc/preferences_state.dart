part of 'preferences_bloc.dart';

class PreferencesState extends Equatable {
  const PreferencesState({required this.locale});

  final Locale locale;

  PreferencesState copyWith({Locale? locale}) {
    return PreferencesState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [locale];
}

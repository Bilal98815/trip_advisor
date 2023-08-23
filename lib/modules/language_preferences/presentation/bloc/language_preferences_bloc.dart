import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:trip_advisor/common/constants/constants.dart';
import 'package:trip_advisor/common/helpers/helpers.dart';
import 'package:trip_advisor/modules/language_preferences/language_preferences.dart';

part 'language_preferences_event.dart';
part 'language_preferences_state.dart';

class LanguagePreferencesBloc
    extends Bloc<LanguagePreferencesEvent, LanguagePreferencesState> {
  LanguagePreferencesBloc({required this.languagePreferencesRepository})
      : super(const LanguagePreferencesState(selectedLocale: kStartingLocale)) {
    on<LanguagePreferencesLocaleChanged>(
      (event, emit) => updateLocale(event.locale, emit),
    );
  }

  final LanguagePreferencesRepository languagePreferencesRepository;

  Future<void> updateLocale(
    Locale locale,
    Emitter<LanguagePreferencesState> emit,
  ) async {
    final String email = await Preferences().getEmail() ?? '';

    await languagePreferencesRepository.updateLocale(
      email: email,
      locale: locale,
    );
    emit(state.copyWith(selectedLocale: locale));
  }
}

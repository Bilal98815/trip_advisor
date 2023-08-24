import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/preferences/preferences.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc({required this.preferencesRepository})
      : super(const PreferencesState()) {
    on<PreferencesLocaleChanged>(
      (event, emit) => updateLocale(event.locale, emit),
    );

    on<PreferencesGetPreferences>((event, emit) => onGetRequested(emit));
  }

  final PreferencesRepository preferencesRepository;

  Future<void> onGetRequested(Emitter<PreferencesState> emit) async {
    final String email = await Preferences().getEmail() ?? '';

    final locale = await preferencesRepository.getLocale(email: email);
    print('subscription called, locale: $locale');
    emit(state.copyWith(locale: locale));
  }

  Future<void> updateLocale(
    Locale locale,
    Emitter<PreferencesState> emit,
  ) async {
    final String email = await Preferences().getEmail() ?? '';

    await preferencesRepository.updateLocale(email: email, locale: locale);
    emit(state.copyWith(locale: locale));
  }
}

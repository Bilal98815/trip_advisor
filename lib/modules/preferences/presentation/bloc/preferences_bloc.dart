import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/language_preferences/language_preferences.dart';
import 'package:trip_advisor/modules/preferences/preferences.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc({required this.preferencesRepository})
      : super(const PreferencesState()) {
    on<PreferencesGetPreferences>((event, emit) => onGetRequested(emit));

    on<PreferencesLanguageChanged>(
      (event, emit) => updateLanguage(event.language, emit),
    );
  }

  final PreferencesRepository preferencesRepository;

  Future<void> onGetRequested(Emitter<PreferencesState> emit) async {
    final String email = await Preferences().getEmail() ?? '';

    final language = await preferencesRepository.getLanguage(email: email);

    emit(state.copyWith(language: language));
  }

  Future<void> updateLanguage(
    Languages language,
    Emitter<PreferencesState> emit,
  ) async {
    final String email = await Preferences().getEmail() ?? '';

    await preferencesRepository.updateLanguage(
      email: email,
      language: language,
    );
    emit(state.copyWith(language: language));
  }
}

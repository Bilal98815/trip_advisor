import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/currency_preferences.dart/presentation/models/models.dart';
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

    on<PreferencesCurrencyChanged>(
      (event, emit) => updateCurrency(event.currency, emit),
    );
  }

  final PreferencesRepository preferencesRepository;

  Future<void> onGetRequested(Emitter<PreferencesState> emit) async {
    final String email = await Preferences().getEmail() ?? '';

    final preferences =
        await preferencesRepository.getPreferences(email: email);

    emit(
      state.copyWith(
        language: preferences?.language,
        currency: preferences?.currency,
      ),
    );
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

  Future<void> updateCurrency(
    Currencies currency,
    Emitter<PreferencesState> emit,
  ) async {
    final String email = await Preferences().getEmail() ?? '';

    await preferencesRepository.updateCurrency(
      email: email,
      currency: currency,
    );
    emit(state.copyWith(currency: currency));
  }
}

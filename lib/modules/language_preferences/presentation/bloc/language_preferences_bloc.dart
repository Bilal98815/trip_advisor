import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_preferences_event.dart';
part 'language_preferences_state.dart';

class LanguagePreferencesBloc
    extends Bloc<LanguagePreferencesEvent, LanguagePreferencesState> {
  LanguagePreferencesBloc() : super(const LanguagePreferencesState()) {
    on<LanguagePreferencesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

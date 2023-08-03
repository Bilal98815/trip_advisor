import 'package:bloc/bloc.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_bloc_state.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_event.dart';

import '../../../../common/helpers/shared_preferences/shared_preferences.dart';
import '../../domain/repository/user_data_repository.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataBlocState> {
  late UserDataRepository userDataRepository;

  UserDataBloc({required this.userDataRepository})
      : super(const UserDataBlocState()) {
    on<UpdateNameEvent>((event, emit) async {
      await updateName(event.name, emit);
    });
    on<UpdateCountryEvent>((event, emit) {
      updateCountry(event.country, emit);
    });
    on<StoreCountryDB>((event, emit) async {
      await updateCountryDB(event.country);
    });
  }

  final prefs = Preferences();

  Future updateName(String name, Emitter emit) async {
    String? email = await prefs.getEmail();

    await userDataRepository.updateStatus(email!, name);
  }

  Future updateCountryDB(String country) async {
    String? email = await prefs.getEmail();
    await userDataRepository.updateCountry(email!, country);
  }

  void updateCountry(String country, Emitter emit) {
    emit(state.copyWith(country: country));
  }
}

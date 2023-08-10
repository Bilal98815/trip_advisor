import 'package:bloc/bloc.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/modules/user_data/domain/repository/user_data_repository.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_bloc_state.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_event.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataBlocState> {
  UserDataBloc({required this.userDataRepository})
      : super(const UserDataBlocState()) {
    on<UpdateNameEvent>((event, emit) async {
      await updateName(event.name, event.email, emit);
    });
    on<UpdateCountryEvent>((event, emit) {
      updateCountry(event.country, emit);
    });
    on<StoreCountryDB>((event, emit) async {
      await updateCountryDB(event.country, event.email);
    });
  }
  late UserDataRepository userDataRepository;

  final prefs = Preferences();

  Future updateName(String name, String email, Emitter emit) async {
    //String? email = await prefs.getEmail();
    await userDataRepository.updateStatus(email, name);
  }

  Future updateCountryDB(String country, String email) async {
    // String? email = await prefs.getEmail();
    await userDataRepository.updateCountry(email, country);
  }

  void updateCountry(String country, Emitter emit) {
    emit(state.copyWith(country: country));
  }
}

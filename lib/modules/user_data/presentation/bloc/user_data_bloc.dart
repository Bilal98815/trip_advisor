import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/helpers/helpers.dart';
import 'package:trip_advisor/modules/user_data/user_data.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

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

  Future<void> updateName(
    String name,
    String email,
    Emitter<UserDataBlocState> emit,
  ) async {
    //String? email = await prefs.getEmail();
    await userDataRepository.updateStatus(email, name);
  }

  Future<void> updateCountryDB(String country, String email) async {
    // String? email = await prefs.getEmail();
    await userDataRepository.updateCountry(email, country);
  }

  void updateCountry(String country, Emitter<UserDataBlocState> emit) {
    emit(state.copyWith(country: country));
  }
}

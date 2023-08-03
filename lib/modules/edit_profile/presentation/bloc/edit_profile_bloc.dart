import 'package:bloc/bloc.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_event.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_state.dart';

import '../../domain/repository/edit_profile_repository.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  late EditProfileRepository editProfileRepository;
  final prefs = Preferences();

  EditProfileBloc({required this.editProfileRepository})
      : super(const EditProfileState()) {
    on<UpdateCountEvent>((event, emit) {
      updateCount(event.count, emit);
    });

    on<UpdateUserEvent>((event, emit) async {
      await updateUser(event.bio, event.name, event.website);
    });

    on<UpdateCountryEvent>((event, emit) {
      updateCountry(event.country, emit);
    });

    on<StoreCountryDbEvent>((event, emit) async {
      await updateCountryDb(event.country);
    });
  }

  void updateCount(int count, Emitter emit) {
    emit(state.copyWith(count: count));
  }

  Future updateUser(String bio, String name, String website) async {
    String? email = await prefs.getEmail();
    await editProfileRepository.updateUser(bio, name, website, email!);
  }

  void updateCountry(String country, Emitter emit) {
    emit(state.copyWith(country: country));
  }

  Future updateCountryDb(String country) async {
    String? email = await prefs.getEmail();
    await editProfileRepository.updateCountry(country, email!);
  }
}

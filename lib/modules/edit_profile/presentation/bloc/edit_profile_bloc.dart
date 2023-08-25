import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/helpers/helpers.dart';
import 'package:trip_advisor/modules/edit_profile/edit_profile.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({required this.editProfileRepository})
      : super(const EditProfileState()) {
    on<UpdateCountEvent>((event, emit) {
      updateCount(event.count, emit);
    });

    on<UpdateUserEvent>((event, emit) async {
      await updateUser(
        emit,
        bio: event.bio,
        name: event.name,
        website: event.website,
        file: event.file,
      );
    });

    on<UpdateCountryEvent>((event, emit) {
      updateCountry(event.country, emit);
    });

    on<StoreCountryDbEvent>((event, emit) async {
      await updateCountryDb(event.country);
    });

    on<ShowLoaderEvent>((event, emit) {
      isShowLoader(event.isLoading, emit);
    });
  }
  late EditProfileRepository editProfileRepository;
  final prefs = Preferences();

  void updateCount(int count, Emitter<EditProfileState> emit) {
    emit(state.copyWith(count: count));
  }

  Future<void> updateUser(
    Emitter<EditProfileState> emit, {
    String? bio,
    String? name,
    String? website,
    Uint8List? file,
  }) async {
    final String? email = await prefs.getEmail();
    emit(state.copyWith(apiState: ApiState.loading));
    await editProfileRepository.updateUser(
      bio: bio,
      name: name,
      website: website,
      email: email,
      file: file,
    );
    emit(state.copyWith(apiState: ApiState.saved));
  }

  void updateCountry(String country, Emitter<EditProfileState> emit) {
    emit(state.copyWith(country: country));
  }

  Future<void> updateCountryDb(String country) async {
    final String? email = await prefs.getEmail();
    await editProfileRepository.updateCountry(country, email!);
  }

  void isShowLoader(bool isLoading, Emitter<EditProfileState> emit) {
    emit(state.copyWith(isLoading: isLoading));
  }
}

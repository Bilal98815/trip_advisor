import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_event.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_state.dart';

import '../../domain/repository/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ProfileRepository profileRepository;
  final prefs = Preferences();

  ProfileBloc({required this.profileRepository}) : super(const ProfileState()) {
    on<GetUserEvent>((event, emit) async {
      await getUserDetails(emit);
    });

    on<DataSavedEvent>((event, emit) {
      isDataSaved(event.apiState, emit);
    });

    on<UploadImagesEvent>((event, emit) async {
      await uploadImages(event.images, emit);
    });
  }

  Future getUserDetails(Emitter emit) async {
    String? email = await prefs.getEmail();
    emit(state.copyWith(apiState: ApiState.loading));
    final user = await profileRepository.getUserDetails(email!);
    emit(state.copyWith(user: user, apiState: ApiState.done));
  }

  void isDataSaved(ApiState apiState, Emitter emit) {
    emit(state.copyWith(apiState: apiState));
  }

  Future uploadImages(List<Uint8List> images, Emitter emit) async {
    String? email = await prefs.getEmail();
    emit(state.copyWith(apiState: ApiState.loading));
    await profileRepository.uploadImagesToFireStore(images, email!);
    emit(state.copyWith(apiState: ApiState.done));
  }
}

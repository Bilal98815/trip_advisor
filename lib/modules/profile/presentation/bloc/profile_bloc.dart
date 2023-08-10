import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/modules/profile/domain/repository/profile_repository.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_event.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
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

    on<PickImagesEvent>((event, emit) async {
      await pickMultipleImagesFromGallery(emit);
    });
  }
  late ProfileRepository profileRepository;
  final prefs = Preferences();

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
    await getUserDetails(emit);
    emit(state.copyWith(apiState: ApiState.done, images: images));
  }

  Future pickMultipleImagesFromGallery(Emitter emit) async {
    final images = await ImagePicker().pickMultiImage();
    if (images.isNotEmpty) {
      List<Uint8List> files = [];
      for (int i = 0; i < images.length; i++) {
        files.add(await images[i].readAsBytes());
      }
      await uploadImages(files, emit);
    }
  }
}

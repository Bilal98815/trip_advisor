import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/common/models/models.dart';
import 'package:trip_advisor/modules/profile/profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

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

    on<UpdateImageEvent>((event, emit) {
      updateImage(event.img, emit);
    });

    on<UpdateImagePathEvent>((event, emit) {
      updateImagePath(event.img, emit);
    });

    on<PickImagesEvent>((event, emit) async {
      await pickMultipleImagesFromGallery(emit);
    });
  }
  late ProfileRepository profileRepository;
  final prefs = Preferences();

  Future<void> getUserDetails(Emitter<ProfileState> emit) async {
    final String? email = await prefs.getEmail();
    emit(state.copyWith(apiState: ApiState.loading));
    final user = await profileRepository.getUserDetails(email!);
    emit(state.copyWith(user: user, apiState: ApiState.done));
  }

  void isDataSaved(ApiState apiState, Emitter<ProfileState> emit) {
    emit(state.copyWith(apiState: apiState));
  }

  Future<void> uploadImages(
    List<Uint8List> images,
    Emitter<ProfileState> emit,
  ) async {
    final String? email = await prefs.getEmail();
    emit(state.copyWith(apiState: ApiState.loading));
    await profileRepository.uploadImagesToFireStore(images, email!);
    await getUserDetails(emit);
    emit(state.copyWith(apiState: ApiState.done, images: images));
  }

  void updateImage(Uint8List img, Emitter<ProfileState> emit) {
    emit(state.copyWith(img: img));
  }

  void updateImagePath(String path, Emitter<ProfileState> emit) {
    emit(state.copyWith(imagePath: path));
  }

  Future<void> pickMultipleImagesFromGallery(Emitter<ProfileState> emit) async {
    final images = await ImagePicker().pickMultiImage();
    if (images.isNotEmpty) {
      final List<Uint8List> files = [];
      for (int i = 0; i < images.length; i++) {
        files.add(await images[i].readAsBytes());
      }
      await uploadImages(files, emit);
    }
  }
}

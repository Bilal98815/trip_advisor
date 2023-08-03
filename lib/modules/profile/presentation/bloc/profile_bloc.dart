import 'package:bloc/bloc.dart';
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
  }

  Future getUserDetails(Emitter emit) async {
    String? email = await prefs.getEmail();
    final user = await profileRepository.getUserDetails(email!);
    emit(state.copyWith(user: user));
  }
}

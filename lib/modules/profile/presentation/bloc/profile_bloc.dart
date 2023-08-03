import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_event.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_state.dart';

import '../../domain/repository/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(const ProfileState()) {
    on<SignOutEvent>((event, emit) async {
      await signOutUser(emit);
    });
  }

  Future signOutUser(Emitter emit) async {
    await profileRepository.signOut();
    emit(state.copyWith(signOutCondition: SignOutCondition.signOut));
  }
}

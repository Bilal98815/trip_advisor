import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/common/helpers/helpers.dart';
import 'package:trip_advisor/modules/account/account.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required this.accountRepository, required this.prefs})
      : super(const AccountState()) {
    on<SignOutEvent>((event, emit) async {
      await signOutUser(emit);
    });

    on<GetProfilePicEvent>((event, emit) async {
      await getProfilePic(emit);
    });

    on<UpdateSigningCondition>((event, emit) {
      updateSigningCondition(event.condition, emit);
    });
  }
  late AccountRepository accountRepository;
  late Preferences prefs;

  Future<void> signOutUser(Emitter<AccountState> emit) async {
    await accountRepository.signOut();
    await clearPrefs();
    emit(state.copyWith(signOutCondition: SignOutCondition.signOut));
  }

  Future<void> clearPrefs() async {
    final prefs = Preferences();
    await prefs.clearPreferences();
  }

  Future<void> getProfilePic(Emitter<AccountState> emit) async {
    final String? email = await prefs.getEmail();
    final image = await accountRepository.getUserProfilePicture(email!);
    emit(state.copyWith(image: image));
  }

  void updateSigningCondition(
    SignOutCondition condition,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(signOutCondition: condition));
  }
}

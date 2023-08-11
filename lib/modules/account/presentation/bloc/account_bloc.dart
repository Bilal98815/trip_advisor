import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/modules/account/account.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required this.accountRepository}) : super(const AccountState()) {
    on<SignOutEvent>((event, emit) async {
      await signOutUser(emit);
    });

    on<UpdateSigningCondition>((event, emit) {
      updateSigningCondition(event.condition, emit);
    });
  }
  late AccountRepository accountRepository;

  Future signOutUser(Emitter emit) async {
    await accountRepository.signOut();
    await clearPrefs();
    emit(state.copyWith(signOutCondition: SignOutCondition.signOut));
  }

  Future clearPrefs() async {
    final prefs = Preferences();
    await prefs.clearPreferences();
  }

  void updateSigningCondition(SignOutCondition condition, Emitter emit) {
    emit(state.copyWith(signOutCondition: condition));
  }
}

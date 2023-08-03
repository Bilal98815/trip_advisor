import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/modules/account/presentation/bloc/account_event.dart';

import '../../domain/repository/account_repository.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  late AccountRepository accountRepository;

  AccountBloc({required this.accountRepository}) : super(const AccountState()) {
    on<SignOutEvent>((event, emit) async {
      await signOutUser(emit);
    });
  }

  Future signOutUser(Emitter emit) async {
    await accountRepository.signOut();
    emit(state.copyWith(signOutCondition: SignOutCondition.signOut));
  }
}

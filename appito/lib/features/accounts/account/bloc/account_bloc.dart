import 'package:appito/_all.dart';

class AccountBloc extends AbstractItemBloc<AccountState> {
  final IAccountRepository accountRepository;

  AccountBloc({required this.accountRepository}) : super(AccountState.initial());

  @override
  Stream<Result> resolveStreamData() => accountRepository.getCurrentUserAccountDataStreamed();
}

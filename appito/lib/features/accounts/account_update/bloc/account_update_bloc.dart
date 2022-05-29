import 'package:appito/_all.dart';

class AccountUpdateBloc extends AbstractFormBloc<AccountUpdateState> {
  final IAccountRepository accountRepository;

  AccountUpdateBloc({
    required AccountUpdateRequestModelValidator modelValidator,
    required this.accountRepository,
  }) : super(AccountUpdateState.initial(), modelValidator);

  @override
  Future<Result> initModel(event, emit) async => await accountRepository.prepareForUpdate();

  @override
  Future<Result> onSubmit(model) async => await accountRepository.update(model);
}

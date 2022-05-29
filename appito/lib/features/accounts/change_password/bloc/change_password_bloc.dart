import 'package:appito/_all.dart';

class ChangePasswordBloc extends AbstractFormBloc<ChangePasswordState> {
  final IAccountRepository accountRepository;

  ChangePasswordBloc({
    required ChangePasswordRequestModelValidator modelValidator,
    required this.accountRepository,
  }) : super(ChangePasswordState.initial(), modelValidator);

  @override
  Future<Result> onSubmit(model) async => await accountRepository.changePassword(model);
}

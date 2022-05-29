import 'package:appito/_all.dart';

class SignUpBloc extends AbstractFormBloc<SignUpState> {
  final IAccountRepository accountRepository;

  SignUpBloc({
    required SignUpRequestModelValidator modelValidator,
    required this.accountRepository,
  }) : super(SignUpState.initial(), modelValidator);

  @override
  Future<Result> onSubmit(model) async => await accountRepository.signUp(model);
}

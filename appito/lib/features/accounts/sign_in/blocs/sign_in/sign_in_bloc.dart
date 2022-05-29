import 'package:appito/_all.dart';

class SignInBloc extends AbstractFormBloc<SignInState> {
  final IAuthenticationRepository authenticationRepository;

  SignInBloc({
    required SignInRequestModelValidator modelValidator,
    required this.authenticationRepository,
  }) : super(SignInState.initial(), modelValidator);

  @override
  Future<Result> onSubmit(model) async => await authenticationRepository.signIn(model);
}

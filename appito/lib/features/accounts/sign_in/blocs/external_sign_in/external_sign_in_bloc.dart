import 'package:appito/_all.dart';

class ExternalSignInBloc extends AbstractFormBloc<ExternalSignInState> {
  final IAuthenticationRepository authenticationRepository;

  ExternalSignInBloc({
    required SignInWithExternalProviderRequestModelValidator modelValidator,
    required this.authenticationRepository,
  }) : super(ExternalSignInState.initial(), modelValidator);

  @override
  Future<Result> initModel(event, Emitter<ExternalSignInState> emit) async => CacheResult(data: event.model);

  @override
  Future<Result> onSubmit(model) async => await authenticationRepository.signInWithExternalProvider(model);
}

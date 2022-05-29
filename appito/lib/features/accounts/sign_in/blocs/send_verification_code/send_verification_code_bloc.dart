import 'package:appito/_all.dart';

class SendVerificationCodeBloc extends AbstractFormBloc<SendVerificationCodeState> {
  final IAuthenticationRepository authenticationRepository;

  SendVerificationCodeBloc({
    required SendVerificationCodeRequestModelValidator modelValidator,
    required this.authenticationRepository,
  }) : super(SendVerificationCodeState.initial(), modelValidator);

  @override
  Future<Result> initModel(event, Emitter<SendVerificationCodeState> emit) async => CacheResult(data: event.model);

  @override
  Future<Result> onSubmit(model) async => await authenticationRepository.sendVerificationCode(model);
}

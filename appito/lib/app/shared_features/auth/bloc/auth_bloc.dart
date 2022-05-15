import 'package:appito/_all.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository authenticationRepository;

  AuthBloc({
    required this.authenticationRepository,
  }) : super(AuthState.initial()) {
    on<AuthCheckEvent>(_check);

    add(AuthCheckEvent());
  }

  Future<void> _check(AuthCheckEvent event, Emitter<AuthState> emit) async {
    final isAuthenticated = await authenticationRepository.isAuthenticated();

    if (isAuthenticated) {
      emit(state.copyWith(status: AuthStateStatus.authenticated));
    } else {
      emit(state.copyWith(status: AuthStateStatus.unAuthenticated));
    }
  }
}

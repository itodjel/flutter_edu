import 'package:appito/_all.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IRestApiClient restApiClient;
  final ICurrentUser currentUser;
  final IAuthenticationRepository authenticationRepository;

  late StreamSubscription _restApiClientStream;

  AuthBloc({
    required this.restApiClient,
    required this.currentUser,
    required this.authenticationRepository,
  }) : super(AuthState.initial()) {
    on<AuthCheckEvent>(_check);
    on<AuthRefreshEvent>(_refresh);
    on<AuthSignOutEvent>(_signOut);

    _restApiClientStream = restApiClient.exceptionHandler.exceptions.stream.listen((exception) {
      if (exception is UnauthorizedException) {
        add(AuthSignOutEvent());
      }
    });

    add(AuthCheckEvent());
  }

  Future<void> _check(AuthCheckEvent event, Emitter<AuthState> emit) async {
    final isAuthenticated = await authenticationRepository.isAuthenticated();

    if (isAuthenticated) {
      emit(state.copyWith(status: AuthStateStatus.authenticated));
      await currentUser.refresh();
    } else {
      emit(state.copyWith(status: AuthStateStatus.unAuthenticated));
    }
  }

  Future<void> _refresh(AuthRefreshEvent event, Emitter<AuthState> emit) async {
    await authenticationRepository.refreshSignIn();

    emit(state.copyWith(status: AuthStateStatus.refreshedSignIn));
    emit(state.copyWith(status: AuthStateStatus.authenticated));
  }

  Future<void> _signOut(AuthSignOutEvent event, Emitter<AuthState> emit) async {
    await authenticationRepository.signOut();

    emit(state.copyWith(status: AuthStateStatus.signedOut));
    emit(state.copyWith(status: AuthStateStatus.unAuthenticated));
  }

  @override
  Future<void> close() {
    _restApiClientStream.cancel();

    return super.close();
  }
}

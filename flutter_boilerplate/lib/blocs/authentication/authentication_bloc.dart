import 'package:flutter_boilerplate/_all.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenticationRepository authenticationRepository;
  final IAccountRepository accountRepository;
  final IStorageRepository storageRepository;

  AuthenticationBloc({
    required this.authenticationRepository,
    required this.accountRepository,
    required this.storageRepository,
  }) : super(initialState()) {
    on<AuthenticationCheckEvent>(_checkAuthentication);
    on<AuthenticationSignInUserFromApiEvent>(_signInUserFromApiAuthentication);
    on<AuthenticationSignOutUserEvent>(_signOutUserAuthenticationEvent);
  }

  static AuthenticationState initialState() {
    return AuthenticationState(
      status: AuthenticationStateStatus.checking,
    );
  }

  Future<void> _checkAuthentication(AuthenticationCheckEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(status: AuthenticationStateStatus.checking));
    final isAuthenticated = await authenticationRepository.isAuthenticated();
    emit(state.copyWith(status: isAuthenticated ? AuthenticationStateStatus.authenticated : AuthenticationStateStatus.unauthenticated));
  }

  Future<void> _signInUserFromApiAuthentication(AuthenticationSignInUserFromApiEvent event, Emitter<AuthenticationState> emit) async {
    if (state.status != AuthenticationStateStatus.authenticated) {
      emit(state.copyWith(status: AuthenticationStateStatus.authenticated));
    }
  }

  Future<void> _signOutUserAuthenticationEvent(AuthenticationSignOutUserEvent event, Emitter<AuthenticationState> emit) async {
    final result = await authenticationRepository.signOut();
    if (result) {
      emit(state.copyWith(status: AuthenticationStateStatus.unauthenticated));
    } else {
      emit(state.copyWith(status: AuthenticationStateStatus.authenticated));
    }
  }
}

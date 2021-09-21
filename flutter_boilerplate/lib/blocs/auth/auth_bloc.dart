import 'package:rest_api_client/rest_api_client.dart';
import 'package:flutter_boilerplate/_all.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IRestApiClient restApiClient;
  final IAuthenticationRepository authenticationRepository;
  final IAccountRepository accountRepository;
  late StreamSubscription _restApiClientSubscription;
  late StreamSubscription _loginBlocSubscription;
  late StreamSubscription _registerBlocSubscription;
  late StreamSubscription _accountUpdateBlocSubscription;

  AuthBloc({
    required this.restApiClient,
    required this.authenticationRepository,
    required this.accountRepository,
    required LoginBloc loginBloc,
    required RegisterBloc registerBloc,
    required AccountUpdateBloc accountUpdateBloc,
  }) : super(AuthState(
          status: AuthStateStatus.checkingAuthentication,
        )) {
    _restApiClientSubscription = restApiClient.exceptions.stream.listen((exception) {
      if (exception is UnauthorizedException) {
        add(AuthSignOutEvent());
      }
    });
    _loginBlocSubscription = loginBloc.stream.listen((loginState) {
      if (loginState.status == LoginStateStatus.submittingSuccess) {
        add(AuthCheckAuthenticationEvent());
      }
    });
    _registerBlocSubscription = registerBloc.stream.listen((registerState) {
      if (registerState.status == RegisterStateStatus.submittingSuccess) {
        add(AuthCheckAuthenticationEvent());
      }
    });
    _accountUpdateBlocSubscription = accountUpdateBloc.stream.listen((accountUpdateState) {
      if (accountUpdateState.status == AccountUpdateStateStatus.submittingSuccess || accountUpdateState.status == AccountUpdateStateStatus.addingAffiliateCodeSuccess) {
        add(AuthCheckAuthenticationEvent());
      }
    });
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthCheckAuthenticationEvent) {
      yield* _checkAuthentication();
    } else if (event is AuthSignOutEvent) {
      yield* _signOut();
    }
  }

  Stream<AuthState> _checkAuthentication() async* {
    try {
      yield state.copyWith(status: AuthStateStatus.checkingAuthentication);

      final isAuthenticated = await authenticationRepository.isAuthenticated();

      yield state.copyWith(status: AuthStateStatus.checkedAuthentication);

      if (isAuthenticated) {
        //To update local account data
        await accountRepository.get();
        yield state.copyWith(status: AuthStateStatus.authenticated);
      } else {
        yield state.copyWith(status: AuthStateStatus.unAuthenticated);

        final isAuthenticatedAsGuest = await authenticationRepository.isAuthenticatedAsGuest();

        if (!isAuthenticatedAsGuest) {
          await authenticationRepository.silentBackgroundGuestLogin();
        }

        yield state.copyWith(status: AuthStateStatus.authenticatedAsGuest);
      }
    } catch (e) {
      yield state.copyWith(status: AuthStateStatus.unAuthenticated);
    }
  }

  Stream<AuthState> _signOut() async* {
    yield state.copyWith(status: AuthStateStatus.unAuthenticated);

    final success = await authenticationRepository.signOut();

    if (success) {
      yield* _checkAuthentication();
    }
  }

  @override
  Future<void> close() {
    _restApiClientSubscription.cancel();
    _loginBlocSubscription.cancel();
    _registerBlocSubscription.cancel();
    _accountUpdateBlocSubscription.cancel();
    return super.close();
  }
}

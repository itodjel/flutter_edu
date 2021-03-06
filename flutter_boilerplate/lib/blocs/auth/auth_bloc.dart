import 'package:rest_api_client/rest_api_client.dart';
import 'package:flutter_boilerplate/_all.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IRestApiClient restApiClient;
  late StreamSubscription _restApiClientSubscription;
  late StreamSubscription _loginBlocSubscription;
  late StreamSubscription _registerBlocSubscription;

  AuthBloc({
    required this.restApiClient,
    required LoginBloc loginBloc,
    required RegisterBloc registerBloc,
  }) : super(AuthState(
          status: AuthStateStatus.unAuthenticated,
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
    yield state.copyWith(status: AuthStateStatus.checkingAuthentication);

    //TODO: Change this to use real API
    final isAuthenticated = false; //await authenticationRepository.isAuthenticated();

    yield state.copyWith(status: AuthStateStatus.checkedAuthentication);

    if (isAuthenticated) {
      yield state.copyWith(status: AuthStateStatus.authenticated);
    } else {
      yield state.copyWith(status: AuthStateStatus.unAuthenticated);
    }
  }

  Stream<AuthState> _signOut() async* {
    yield state.copyWith(status: AuthStateStatus.unAuthenticated);

    //TODO: Sign the use our for real
    final success = true; //await authenticationRepository.signOut();

    if (success) {
      yield* _checkAuthentication();
    }
  }

  @override
  Future<void> close() {
    _restApiClientSubscription.cancel();
    _loginBlocSubscription.cancel();
    _registerBlocSubscription.cancel();

    return super.close();
  }
}

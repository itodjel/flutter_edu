import 'package:rest_api_client/rest_api_client.dart';
import 'package:flutter_boilerplate/_all.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IRestApiClient restApiClient;
  final IAuthenticationRepository authenticationRepository;
  late StreamSubscription _restApiClientSubscription;
  late StreamSubscription _signInBlocSubscription;
  late StreamSubscription _registerBlocSubscription;

  AuthBloc({
    required this.restApiClient,
    required this.authenticationRepository,
    required SignInBloc signInBloc,
    required RegisterBloc registerBloc,
  }) : super(AuthState(
          status: AuthStateStatus.unAuthenticated,
        )) {
    _restApiClientSubscription = restApiClient.exceptions.stream.listen((exception) {
      if (exception is UnauthorizedException) {
        add(AuthSignOutEvent());
      }
    });
    _signInBlocSubscription = signInBloc.stream.listen((signInState) {
      if (signInState.status == SignInStateStatus.submittingSuccess) {
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
    final isAuthenticated = await authenticationRepository.isAuthenticated();

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
    _signInBlocSubscription.cancel();
    _registerBlocSubscription.cancel();

    return super.close();
  }
}

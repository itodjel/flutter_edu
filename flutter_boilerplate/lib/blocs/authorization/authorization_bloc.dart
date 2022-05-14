import 'package:flutter_boilerplate/_all.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final IAuthenticationRepository authenticationRepository;
  //final IAuthorizationRepository authorizationRepository;
  late StreamSubscription _authenticationBlocSubscription;

  AuthorizationBloc({
    required this.authenticationRepository,
    //required this.authorizationRepository,
    required AuthenticationBloc authenticationBloc,
  }) : super(initialState()) {
    on<AuthorizationCheckEvent>(_checkAuthorization);

    _authenticationBlocSubscription = authenticationBloc.stream.listen((authenticationState) {
      if (authenticationState.status == AuthenticationStateStatus.authenticated) {
        add(AuthorizationCheckEvent());
      }
    });
  }

  static AuthorizationState initialState() => AuthorizationState(status: AuthorizationStateStatus.unauthorized);

  Future<void> _checkAuthorization(AuthorizationCheckEvent event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(status: AuthorizationStateStatus.checking));
    final storedUser = await authenticationRepository.getStoredUser();
    if (storedUser == null) {
      emit(state.copyWith(status: AuthorizationStateStatus.unauthorized));
    } else {
      emit(state.copyWith(status: AuthorizationStateStatus.authorized));
    }
  }

  @override
  Future<void> close() {
    _authenticationBlocSubscription.cancel();
    return super.close();
  }
}

import 'package:appito/_all.dart';

class CurrentUserBloc extends Bloc<CurrentUserEvent, CurrentUserState> {
  final ICurrentUser currentUser;

  late StreamSubscription _authBlocStream;

  CurrentUserBloc({
    required AuthBloc authBloc,
    required this.currentUser,
  }) : super(CurrentUserState.initial()) {
    on<CurrentUserRefreshEvent>(_refresh);

    _authBlocStream = authBloc.stream.listen((authState) {
      if ([
        AuthStateStatus.authenticated,
        AuthStateStatus.refreshedSignIn,
      ].contains(authState.status)) {
        add(CurrentUserRefreshEvent());
      }
    });
  }

  Future<void> _refresh(CurrentUserRefreshEvent event, Emitter<CurrentUserState> emit) async {
    emit(state.copyWith(status: CurrentUserStateStatus.initializing));

    await currentUser.refresh();

    final account = await currentUser.instance;

    emit(
      state.copyWith(
        status: account != null ? CurrentUserStateStatus.initialized : CurrentUserStateStatus.unInitialized,
        account: account,
      ),
    );
  }

  @override
  Future<void> close() {
    _authBlocStream.cancel();

    return super.close();
  }
}

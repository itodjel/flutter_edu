import 'package:appito/_all.dart';

class AccountBloc extends AbstractItemBloc<AccountState> {
  final IAccountRepository accountRepository;

  late StreamSubscription _currentUserStream;

  AccountBloc({
    required this.accountRepository,
    required ICurrentUser currentUser,
  }) : super(AccountState.initial()) {
    on<AccountToggleEvent>(_toggle);

    _currentUserStream = currentUser.data.stream.listen((exception) {
      add(AbstractItemLoadEvent());
    });
  }

  @override
  Stream<Result> resolveStreamData() => accountRepository.getCurrentUserAccountDataStreamed();

  Future<void> _toggle(AccountToggleEvent event, Emitter<AccountState> emit) async {
    emit(state.copyWith(status: AccountStateStatus.toggling));

    final result = await accountRepository.toggleCurrentCompany(ToggleCurrentCompanyRequestModel(companyId: event.companyId));

    if (result.isSuccess) {
      emit(state.copyWith(status: AccountStateStatus.togglingSuccess));
    } else {
      emit(state.copyWith(status: AccountStateStatus.togglingError));
    }
  }

  @override
  Future<void> close() {
    _currentUserStream.cancel();

    return super.close();
  }
}

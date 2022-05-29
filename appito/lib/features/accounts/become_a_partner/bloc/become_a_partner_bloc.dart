import 'package:appito/_all.dart';

class BecomeAPartnerBloc extends AbstractFormBloc<BecomeAPartnerState> {
  final IAccountRepository accountRepository;

  BecomeAPartnerBloc({
    required this.accountRepository,
  }) : super(BecomeAPartnerState.initial());

  @override
  Future<Result> onSubmit(model) async => await accountRepository.becomeAPartner();
}

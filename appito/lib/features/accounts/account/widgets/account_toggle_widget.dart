import 'package:appito/_all.dart';

class AccountToggle extends StatelessWidget {
  const AccountToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 3,
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<AccountBloc, AccountState>(
          listener: (context, accountState) {
            if (accountState.status == AccountStateStatus.togglingSuccess) {
              context.read<AuthBloc>().add(AuthRefreshEvent());
            }
          },
          builder: (context, accountState) {
            return PositionedLoader(
              top: 0,
              right: 0,
              isLoading: accountState.status == AccountStateStatus.toggling,
              child: BlocBuilder<AccountBloc, AccountState>(
                builder: (context, accountState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Change profile',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const Gap(20),
                      Button(
                        child: Row(
                          children: [
                            Text(
                              'Client',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: accountState.item?.currentCompany == null ? context.theme.primaryColor : null,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          if (accountState.item?.currentCompany != null) {
                            context.read<AccountBloc>().add(AccountToggleEvent());
                          }
                        },
                      ),
                      const Gap(20),
                      ...accountState.item?.employees
                              ?.map<Widget>(
                                (accountEmployee) => Button(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${accountEmployee.company?.name} (Company)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: accountState.isCompanySelected(accountEmployee.company?.id) ? context.theme.primaryColor : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    if (!accountState.isCompanySelected(accountEmployee.company?.id)) {
                                      context.read<AccountBloc>().add(AccountToggleEvent(companyId: accountEmployee.company?.id));
                                    }
                                  },
                                ),
                              )
                              .toList() ??
                          [],
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

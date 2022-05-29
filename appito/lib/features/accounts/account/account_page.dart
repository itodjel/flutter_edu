import 'package:appito/_all.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<AccountBloc>(),
      child: AppScaffold(
        body: AbstractItemConsumer<AccountBloc, AccountState, AccountResponseModel>(
          builder: (context, state, item) {
            return ListView(
              children: [
                Column(
                  children: [
                    if (item.profilePhoto != null) ...{
                      Image.network(item.profilePhoto!.url.value),
                      const Gap(20),
                    },
                    if (state.showCompaniesToggle) ...{
                      const AccountToggle(),
                      const Gap(20),
                    },
                    const ConnectThirdPartySignInProvidersWidget(),
                    const Gap(20),
                    if (state.showProfilePhoto) Image.network(state.item?.photoUrl ?? ''),
                  ],
                ),
                ListTile(
                  title: const Text('Edit profile'),
                  onTap: () => context.push(AccountUpdatePage.route),
                ),
                if (item.accountType == AccountType.client) ...{
                  ListTile(
                    title: const Text('Become a partner'),
                    onTap: () => context.push(BecomeAPartnerPage.route),
                  ),
                },
                ListTile(
                  title: const Text('Change password'),
                  onTap: () => context.push(ChangePasswordPage.route),
                ),
                ListTile(
                  title: const Text('Sign out'),
                  onTap: () => context.read<AuthBloc>().add(AuthSignOutEvent()),
                ),
                const Gap(30),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:appito/_all.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<AccountBloc>(),
      child: AppScaffold(
        body: AbstractItemConsumer<AccountBloc, AccountState, AccountResponseModel>(
          builder: (context, accountState, item) {
            return ListView(
              children: [
                Column(
                  children: [
                    if (item.profilePhoto != null) ...{
                      Image.network(item.profilePhoto!.url.value),
                      const Gap(20),
                    },
                  ],
                ),
                ListTile(
                  title: const Text('Edit profile'),
                  onTap: () => context.push(AccountUpdatePage.route),
                ),
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

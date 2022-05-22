import 'package:appito/_all.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<AccountBloc>(),
      child: AppScaffold(
        body: AbstractItemConsumer<AccountBloc, AccountState>(
          builder: (accountState) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      if (accountState.showProfilePhoto) Image.network(accountState.item?.photoUrl ?? ''),
                    ],
                  ),
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

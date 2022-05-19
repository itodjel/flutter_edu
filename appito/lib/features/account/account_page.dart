import 'package:appito/_all.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<AccountBloc>(),
      child: Scaffold(
        body: AbstractItemConsumer<AccountBloc, AccountState>(
          builder: (accountState) {
            return Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text('Account data'),
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

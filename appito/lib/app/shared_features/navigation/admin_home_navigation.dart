import 'package:appito/_all.dart';

class AdminHomeNavigation extends StatelessWidget {
  const AdminHomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, navigationState) {
          switch (navigationState.index) {
            case 0:
              return const Center(child: Text('Admin Home'));
            case 1:
              return const AccountPage();
            default:
              return const Center(child: Text('Invalid navigation index'));
          }
        },
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, navigationState) {
        return BottomNavigationBar(
          onTap: (index) => context.read<NavigationBloc>().add(NavigationChangeIndexEvent(index: index)),
          currentIndex: navigationState.index,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              backgroundColor: context.theme.primaryColor,
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.supervised_user_circle),
              backgroundColor: context.theme.primaryColor,
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}

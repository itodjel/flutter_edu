import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:appito/_all.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, navigationState) {
          switch (navigationState.index) {
            case 0:
              return const Center(child: Text('Home'));
            case 1:
              return const Center(child: Text('Map'));
            case 2:
              return const Center(child: Text('Favorites'));
            case 3:
              return const AccountPage();
            default:
              return const Center(child: Text('Invalid navigation index'));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const _CurvedBottomNavigationBar(),
    );
  }
}

// ignore: unused_element
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}

class _CurvedBottomNavigationBar extends StatelessWidget {
  const _CurvedBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, navigationState) {
        return AnimatedBottomNavigationBar(
          icons: const [
            Icons.home,
            Icons.map,
            Icons.favorite,
            Icons.supervised_user_circle,
          ],
          backgroundColor: context.theme.bottomNavigationBarTheme.backgroundColor,
          activeColor: context.theme.bottomNavigationBarTheme.selectedItemColor,
          inactiveColor: context.theme.bottomNavigationBarTheme.unselectedItemColor,
          activeIndex: navigationState.index,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => context.read<NavigationBloc>().add(NavigationChangeIndexEvent(index: index)),
        );
      },
    );
  }
}

// ignore_for_file: unused_element

import 'package:appito/_all.dart';

class ITOBottomNavigationBar extends StatelessWidget {
  const ITOBottomNavigationBar({
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

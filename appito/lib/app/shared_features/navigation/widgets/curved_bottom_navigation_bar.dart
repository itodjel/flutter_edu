// ignore_for_file: unused_element

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:appito/_all.dart';

class CurvedBottomNavigationBar extends StatelessWidget {
  const CurvedBottomNavigationBar({Key? key}) : super(key: key);

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

import 'package:appito/_all.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !context.isSmallScreen || context.isLandscape ? AppBar() : null,
      drawer: const ITODrawer(),
      extendBody: true,
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, navigationState) {
          switch (navigationState.index) {
            case 0:
              return const Home();
            case 1:
              return const Center(child: Text('Map'));
            case 2:
              return const Center(child: Text('Favorites'));
            case 3:
              return const Center(child: Text('Profile'));
            default:
              return const Center(child: Text('Invalid navigation index'));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: (context.isPortrait)
          ? ResponsiveLayoutBuilder(
              small: (_, __) => FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            )
          : null,
      bottomNavigationBar: (context.isPortrait)
          ? ResponsiveLayoutBuilder(
              small: (_, __) => const CurvedBottomNavigationBar(),
            )
          : null,
    );
  }
}

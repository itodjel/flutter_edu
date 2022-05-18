import 'package:appito/_all.dart';

class ITODrawer extends StatelessWidget {
  const ITODrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          const Gap(10),
          ListTile(
            title: const Text('AppITO'),
            onTap: () {
              context.read<NavigationBloc>().add(NavigationChangeIndexEvent(index: 0));
              Navigator.of(context).pop();
            },
          ),
          const Gap(10),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              context.read<NavigationBloc>().add(NavigationChangeIndexEvent(index: 0));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Map'),
            onTap: () {
              context.read<NavigationBloc>().add(NavigationChangeIndexEvent(index: 1));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {
              context.read<NavigationBloc>().add(NavigationChangeIndexEvent(index: 2));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            title: const Text('Account'),
            onTap: () {
              context.read<NavigationBloc>().add(NavigationChangeIndexEvent(index: 3));
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

import 'package:appito/_all.dart';

// Register singleton blocs for the app
class AppBlocs extends StatelessWidget {
  final Widget child;

  const AppBlocs({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: services.get<AuthBloc>()),
        BlocProvider<ThemeBloc>.value(value: services.get<ThemeBloc>()),
        BlocProvider<ErrorHandlerBloc>.value(value: services.get<ErrorHandlerBloc>()),
        BlocProvider<NavigationBloc>.value(value: services.get<NavigationBloc>()),
        BlocProvider<AppNavigationBloc>.value(value: services.get<AppNavigationBloc>()),
      ],
      child: child,
    );
  }
}

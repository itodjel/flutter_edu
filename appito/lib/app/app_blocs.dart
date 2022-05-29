import 'package:appito/_all.dart';

// Register singleton blocs for the app
class AppBlocs extends StatelessWidget {
  final Widget child;

  const AppBlocs({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        _<AuthBloc>(),
        _<CurrentUserBloc>(),
        _<LocalizationBloc>(),
        _<ThemeBloc>(),
        _<ErrorHandlerBloc>(),
        _<IntroBloc>(),
        _<NavigationBloc>(),
        _<AppNavigationBloc>(),
      ],
      child: child,
    );
  }

  BlocProvider<T> _<T extends StateStreamableSource<Object?>>() => BlocProvider<T>.value(value: services.get<T>());
}

import 'package:appito/_all.dart';

// Register singleton blocs for the app
class AppBlocs extends StatelessWidget {
  final Widget child;

  const AppBlocs({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        _blocProvider<AuthBloc>(),
        _blocProvider<LocalizationBloc>(),
        _blocProvider<ThemeBloc>(),
        _blocProvider<ErrorHandlerBloc>(),
        _blocProvider<IntroBloc>(),
        _blocProvider<NavigationBloc>(),
        _blocProvider<AppNavigationBloc>(),
      ],
      child: child,
    );
  }

  BlocProvider<T> _blocProvider<T extends StateStreamableSource<Object?>>() => BlocProvider<T>.value(value: services.get<T>());
}

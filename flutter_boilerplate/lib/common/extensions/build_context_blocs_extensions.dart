import 'package:flutter_boilerplate/_all.dart';

extension BuildContextBlocsExtensions on BuildContext {
  ErrorHandlerBloc get errorHandlerBloc => read<ErrorHandlerBloc>();
  LocalizationBloc get localizationBloc => read<LocalizationBloc>();
  NavigationBloc get navigationBloc => read<NavigationBloc>();
  ThemeBloc get themeBloc => read<ThemeBloc>();
}

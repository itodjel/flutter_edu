import 'package:flutter_boilerplate/_all.dart';

extension BuildContextBlocsExtensions on BuildContext {
  AppBloc get appBloc => read<AppBloc>();
  ConfigurationBloc get configurationBloc => read<ConfigurationBloc>();
  ConnectivityBloc get connectivityBloc => read<ConnectivityBloc>();
  ErrorHandlerBloc get errorHandlerBloc => read<ErrorHandlerBloc>();
  IntroductionBloc get introductionBloc => read<IntroductionBloc>();
  LocalizationBloc get localizationBloc => read<LocalizationBloc>();
  LocationBloc get locationBloc => read<LocationBloc>();
  NavigationBloc get navigationBloc => read<NavigationBloc>();
  QuantityBloc get quantityBloc => read<QuantityBloc>();
  ThemeBloc get themeBloc => read<ThemeBloc>();
}

import 'package:flutter_boilerplate/_all.dart';

extension BuildContextBlocsExtensions on BuildContext {
  AppBloc get appBloc => read<AppBloc>();
  AuthBloc get authBloc => read<AuthBloc>();
  ConfigurationBloc get configurationBloc => read<ConfigurationBloc>();
  ConnectivityBloc get connectivityBloc => read<ConnectivityBloc>();
  ErrorHandlerBloc get errorHandlerBloc => read<ErrorHandlerBloc>();
  GalleryBloc get galleryBloc => read<GalleryBloc>();
  IntroductionBloc get introductionBloc => read<IntroductionBloc>();
  LocalizationBloc get localizationBloc => read<LocalizationBloc>();
  LocationBloc get locationBloc => read<LocationBloc>();
  SignInBloc get signInBloc => read<SignInBloc>();
  NavigationBloc get navigationBloc => read<NavigationBloc>();
  QuantityBloc get quantityBloc => read<QuantityBloc>();
  RegisterBloc get registerBloc => read<RegisterBloc>();
  ResetPasswordBloc get resetPasswordBloc => read<ResetPasswordBloc>();
  ThemeBloc get themeBloc => read<ThemeBloc>();
}

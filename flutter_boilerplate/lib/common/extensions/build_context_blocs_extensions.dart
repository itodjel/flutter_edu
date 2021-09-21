import 'package:flutter_boilerplate/_all.dart';

extension BuildContextBlocsExtensions on BuildContext {
  AccountUpdateBloc get accountUpdateBloc => read<AccountUpdateBloc>();
  AppBloc get appBloc => read<AppBloc>();
  AuthBloc get authBloc => read<AuthBloc>();
  ChatBloc get chatBloc => read<ChatBloc>();
  ConfigurationBloc get configurationBloc => read<ConfigurationBloc>();
  ConnectivityBloc get connectivityBloc => read<ConnectivityBloc>();
  ErrorHandlerBloc get errorHandlerBloc => read<ErrorHandlerBloc>();
  EventDetailsBloc get eventDetailsBloc => read<EventDetailsBloc>();
  EventsByHostBloc get eventsByHostBloc => read<EventsByHostBloc>();
  EventsSearchBloc get eventsSearchBloc => read<EventsSearchBloc>();
  IntroductionBloc get introductionBloc => read<IntroductionBloc>();
  LocalizationBloc get localizationBloc => read<LocalizationBloc>();
  LocationBloc get locationBloc => read<LocationBloc>();
  LoginBloc get loginBloc => read<LoginBloc>();
  NavigationBloc get navigationBloc => read<NavigationBloc>();
  OrderCheckoutBloc get orderCheckoutBloc => read<OrderCheckoutBloc>();
  OrderDetailsBloc get orderDetailsBloc => read<OrderDetailsBloc>();
  OrdersBloc get ordersBloc => read<OrdersBloc>();
  QuantityBloc get quantityBloc => read<QuantityBloc>();
  QRDonationScannerBloc get qrDonationScannerBloc => read<QRDonationScannerBloc>();
  QRTicketScannerBloc get qrTicketScannerBloc => read<QRTicketScannerBloc>();
  RegisterBloc get registerBloc => read<RegisterBloc>();
  ShareTicketBloc get shareTicketBloc => read<ShareTicketBloc>();
  ShoppingCartBloc get shoppingCartBloc => read<ShoppingCartBloc>();
  ShoppingCartAddBloc get shoppingCartAddBloc => read<ShoppingCartAddBloc>();
  ShoppingCartDeleteBloc get shoppingCartDeleteBloc => read<ShoppingCartDeleteBloc>();
  ShoppingCartUpdateBloc get shoppingCartUpdateBloc => read<ShoppingCartUpdateBloc>();
  ThemeBloc get themeBloc => read<ThemeBloc>();
  ChangePasswordBloc get changePasswordBloc => read<ChangePasswordBloc>();
  MyHostedEventsBloc get myHostedEventsBloc => read<MyHostedEventsBloc>();
  MyTicketsAttendingBloc get myTicketsAttendingBloc => read<MyTicketsAttendingBloc>();
  EventCategoriesBloc get eventCategoriesBloc => read<EventCategoriesBloc>();
  EventSearchFiltersBloc get eventSearchFiltersBloc => read<EventSearchFiltersBloc>();
  EventCompareBloc get eventCompareBloc => read<EventCompareBloc>();
  EventsAdvancedSearchBloc get eventsAdvancedSearchBloc => read<EventsAdvancedSearchBloc>();
  ResetPasswordBloc get resetPasswordBloc => read<ResetPasswordBloc>();
  GuestsBloc get guestsBloc => read<GuestsBloc>();
  MyTicketsHistoryBloc get myTicketsHistoryBloc => read<MyTicketsHistoryBloc>();
  WishlistBloc get wishlistBloc => read<WishlistBloc>();
  DonationBloc get donationBloc => read<DonationBloc>();
}

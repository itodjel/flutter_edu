import 'package:flutter_boilerplate/_all.dart';

class ContextServiceProviderBlocs extends StatelessWidget {
  final Widget child;

  const ContextServiceProviderBlocs({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ! Keep Blocs sorted by dependencies (only dependencies to other Blocs)
      providers: [
        // *
        // * Without dependencies
        // *
        BlocProvider<ConnectivityBloc>(
          lazy: false,
          create: (BuildContext context) => ConnectivityBloc(
            appSettings: context.appSettings,
          )..add(ConnectivityInitEvent()),
        ),
        BlocProvider<ErrorHandlerBloc>(
          create: (BuildContext context) => ErrorHandlerBloc(
            restApiClient: context.serviceProvider.restApiClient,
          ),
        ),
        BlocProvider<LocalizationBloc>(
          lazy: false,
          create: (BuildContext context) => LocalizationBloc(
            restApiClient: context.serviceProvider.restApiClient,
            storageRepository: context.serviceProvider.storageRepository,
          )..add(LocalizationInitEvent()),
        ),
        BlocProvider<LocationBloc>(
          lazy: false,
          create: (BuildContext context) => LocationBloc(
            locationRepository: context.serviceProvider.locationRepository,
          ),
        ),
        BlocProvider<NavigationBloc>(
          lazy: false,
          create: (BuildContext context) => NavigationBloc(),
        ),
        BlocProvider<ThemeBloc>(
          lazy: false,
          create: (BuildContext context) => ThemeBloc(
            storageRepository: context.serviceProvider.storageRepository,
          )..add(ThemeInitEvent()),
        ),
        BlocProvider<IntroductionBloc>(
          lazy: false,
          create: (BuildContext context) => IntroductionBloc(
            storageRepository: context.serviceProvider.storageRepository,
          )..add(IntroductionInitEvent()),
        ),
        BlocProvider<GalleryBloc>(
          create: (BuildContext context) => GalleryBloc(
            galleryRepository: context.serviceProvider.galleryRepository,
            permissionsRepository: context.serviceProvider.permissionsRepository,
          ),
        ),
        // *
        // * With dependencies
        // *
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (BuildContext context) => AuthBloc(
            restApiClient: context.serviceProvider.restApiClient,
            authenticationRepository: context.serviceProvider.authenticationRepository,
            accountRepository: context.serviceProvider.accountRepository,
            loginBloc: context.loginBloc,
            registerBloc: context.registerBloc,
            accountUpdateBloc: context.accountUpdateBloc,
          )..add(AuthCheckAuthenticationEvent()),
        ),
        BlocProvider<ProfileBloc>(
          lazy: false,
          create: (BuildContext context) => ProfileBloc(
            accountRepository: context.serviceProvider.accountRepository,
            authBloc: context.authBloc,
          ),
        ),
        BlocProvider<EventCompareBloc>(
          lazy: false,
          create: (BuildContext context) => EventCompareBloc(
            eventsRepository: context.serviceProvider.eventsRepository,
          ),
        ),
        BlocProvider<EventsSearchBloc>(
          lazy: false,
          create: (BuildContext context) => EventsSearchBloc(
            eventsRepository: context.serviceProvider.eventsRepository,
          )..add(EventsSearchLoadEvent()),
        ),
        BlocProvider<ShoppingCartBloc>(
          lazy: false,
          create: (BuildContext context) => ShoppingCartBloc(
            shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
            authBloc: context.authBloc,
            orderCheckoutBloc: context.orderCheckoutBloc,
            shoppingCartAddBloc: context.shoppingCartAddBloc,
            shoppingCartDeleteBloc: context.shoppingCartDeleteBloc,
            shoppingCartUpdateBloc: context.shoppingCartUpdateBloc,
          ),
        ),
        BlocProvider<ConfigurationBloc>(
          lazy: false,
          create: (BuildContext context) => ConfigurationBloc(
            accountRepository: context.serviceProvider.accountRepository,
            authBloc: context.authBloc,
            locationBloc: context.locationBloc,
          ),
        ),
        // BlocProvider<ChatBloc>(
        //   lazy: false,
        //   create: (BuildContext context) => ChatBloc(
        //     chatRepository: context.serviceProvider.chatRepository,
        //     authBloc: context.authBloc,
        //   ),
        // ),
        BlocProvider<AppBloc>(
          lazy: false,
          create: (BuildContext context) => AppBloc(
            appSettings: context.serviceProvider.appSettings,
            authBloc: context.authBloc,
            themeBloc: context.themeBloc,
            locationBloc: context.locationBloc,
            localizationBloc: context.localizationBloc,
            connectivityBloc: context.connectivityBloc,
            configurationBloc: context.configurationBloc,
          ),
        ),
        BlocProvider<MyActiveEventsBloc>(
          lazy: false,
          create: (BuildContext context) => MyActiveEventsBloc(
            eventsRepository: context.serviceProvider.eventsRepository,
            authBloc: context.authBloc,
            configurationBloc: context.configurationBloc,
          ),
        ),
        BlocProvider<MyHostedEventsBloc>(
          lazy: false,
          create: (BuildContext context) => MyHostedEventsBloc(
            eventsRepository: context.serviceProvider.eventsRepository,
            authBloc: context.authBloc,
            configurationBloc: context.configurationBloc,
          ),
        ),
        BlocProvider<MyTicketsAttendingBloc>(
          lazy: false,
          create: (BuildContext context) => MyTicketsAttendingBloc(
            ticketsRepository: context.serviceProvider.ticketsRepository,
            authBloc: context.authBloc,
          ),
        ),

        BlocProvider<EventSearchFiltersBloc>(
          lazy: false,
          create: (BuildContext context) => EventSearchFiltersBloc(
            eventsRepository: context.serviceProvider.eventsRepository,
          )..add(LoadEventFiltersEvent()),
        ),
        BlocProvider<EventsAdvancedSearchBloc>(
          lazy: false,
          create: (BuildContext context) => EventsAdvancedSearchBloc(
            eventsRepository: context.serviceProvider.eventsRepository,
          ),
        ),
        BlocProvider<MyTicketsHistoryBloc>(
          lazy: false,
          create: (BuildContext context) => MyTicketsHistoryBloc(
            ticketsRepository: context.serviceProvider.ticketsRepository,
            authBloc: context.authBloc,
          ),
        ),
        BlocProvider<EventCategoriesBloc>(
          lazy: false,
          create: (BuildContext context) => EventCategoriesBloc(
            categoriesRepository: context.serviceProvider.categoriesRepository,
          )..add(LoadEventCategoriesEvent()),
        ),
        BlocProvider<WishlistBloc>(
          lazy: false,
          create: (BuildContext context) => WishlistBloc(
            shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
            authBloc: context.authBloc,
          ),
        ),
        BlocProvider<DonationBloc>(
          lazy: false,
          create: (BuildContext context) => DonationBloc(
            donationsRepository: context.serviceProvider.donationsRepository,
            shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
          ),
        ),
      ],
      child: child,
    );
  }
}

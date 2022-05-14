import 'package:flutter_boilerplate/_all.dart';

class OnlyNetworkPageWrapper extends StatefulWidget {
  final Widget page;

  const OnlyNetworkPageWrapper({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  _OnlyNetworkPageWrapperState createState() => _OnlyNetworkPageWrapperState();
}

class _OnlyNetworkPageWrapperState extends State<OnlyNetworkPageWrapper> {
  final _noInternetPageOverlayEntry = OverlayEntry(builder: (_) => const NoInternetPage());

  @override
  Widget build(BuildContext context) {
    print('ONLY NETWORK PAGE WRAPPER');

    return BlocConsumer<ConnectivityBloc, ConnectivityState>(
      listener: (context, connectivityState) {
        final overlayState = Overlay.of(context);

        if (!connectivityState.isConnected) {
          overlayState?.insert(_noInternetPageOverlayEntry);
        } else {
          if (overlayState != null && _noInternetPageOverlayEntry.mounted) {
            _noInternetPageOverlayEntry.remove();
          }
        }
      },
      builder: (context, connectivityState) {
        return WillPopScope(
          onWillPop: () async => connectivityState.isConnected,
          child: widget.page,
        );
      },
    );
  }
}

import 'package:flutter_boilerplate/all.dart';

class ContextServiceProviderGeneral extends StatelessWidget {
  final Widget child;

  ContextServiceProviderGeneral({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Register general services here so they will be available through context
      ],
      child: child,
    );
  }
}

import 'package:flutter_boilerplate/all.dart';

class ContextServiceProviderBlocs extends StatelessWidget {
  final Widget child;

  ContextServiceProviderBlocs({required this.child});

  @override
  Widget build(BuildContext context) {
    //Remove this line once there is atleast one item in the MultiBlocProvider
    return child;
    return MultiBlocProvider(
      providers: [
        //Register blocs services here so they will be available through context
      ],
      child: child,
    );
  }
}

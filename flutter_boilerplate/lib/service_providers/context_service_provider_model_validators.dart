import 'package:flutter_boilerplate/all.dart';

class BlocContextServiceModelValidators extends StatelessWidget {
  final Widget child;

  const BlocContextServiceModelValidators({required this.child});

  @override
  Widget build(BuildContext context) {
    //Remove this line once there is atleast one item in the MultiBlocProvider
    return child;
    return MultiBlocProvider(
      providers: const [
        //Register model validators here so they will be available through context
      ],
      child: child,
    );
  }
}

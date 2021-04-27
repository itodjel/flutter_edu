import 'package:flutter_boilerplate/all.dart';

class BlocContextServiceModelValidator extends StatelessWidget {
  final Widget child;

  BlocContextServiceModelValidator({required this.child});

  @override
  Widget build(BuildContext context) {
    //Remove this line once there is atleast one item in the MultiBlocProvider
    return child;
    return MultiBlocProvider(
      providers: [
        //Register model validators here so they will be available through context
      ],
      child: child,
    );
  }
}

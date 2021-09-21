import 'package:flutter_boilerplate/_all.dart';
import 'package:provider/provider.dart';

class ContextServiceProviderModelValidator extends StatelessWidget {
  final Widget? child;

  const ContextServiceProviderModelValidator({this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Register model validators here so they will be available through context
        Provider<PositiveNumberPropertyValidator>(
          create: (_) => PositiveNumberPropertyValidator(localizer: context.localizer),
        ),
      ],
      child: child,
    );
  }
}

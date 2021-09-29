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
        Provider<RegisterModelValidator>(
          create: (_) => RegisterModelValidator(localizer: context.localizer),
        ),
        Provider<ResetPasswordModelValidator>(
          create: (_) => ResetPasswordModelValidator(localizer: context.localizer),
        ),
        Provider<SignInModelValidator>(
          create: (_) => SignInModelValidator(localizer: context.localizer),
        ),
      ],
      child: child,
    );
  }
}

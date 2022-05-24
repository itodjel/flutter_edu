import 'package:appito/_all.dart';

class ExternalSignInWidget extends StatelessWidget {
  const ExternalSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (context.platform.isGoogleSignInAvailable) ...{
          _ExternalSignInButton(
            signInProvider: SignInProvider.google,
            builder: (_, __, onTap, isLoading) {
              return Button(
                text: 'Google',
                primary: true,
                isLoading: isLoading,
                onTap: onTap,
              );
            },
          ),
          const Gap(20)
        },
        if (context.platform.isFacebookSignInAvailable) ...{
          _ExternalSignInButton(
            signInProvider: SignInProvider.facebook,
            builder: (_, __, onTap, isLoading) {
              return Button(
                text: 'Facebook',
                primary: true,
                isLoading: isLoading,
                onTap: onTap,
              );
            },
          ),
          const Gap(20),
        },
        if (context.platform.isAppleSignInAvailable) ...{
          _ExternalSignInButton(
            signInProvider: SignInProvider.apple,
            builder: (_, __, onTap, isLoading) {
              return Button(
                text: 'Apple',
                primary: true,
                isLoading: isLoading,
                onTap: onTap,
              );
            },
          ),
          const Gap(20),
        },
        Button(
          text: 'Phone number',
          primary: true,
          onTap: () => context.push(SignInWithPhoneNumberPage.route, SignInWithPhoneNumberPageModel(text: 'Hello world of navigation!')),
        ),
        const Gap(20),
      ],
    );
  }
}

class _ExternalSignInButton extends StatelessWidget {
  final SignInProvider signInProvider;
  final Widget Function(BuildContext, ExternalSignInState, VoidCallback onTap, bool isLoading) builder;

  const _ExternalSignInButton({
    Key? key,
    required this.signInProvider,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<ExternalSignInBloc>()..add(ExternalSignInInitEvent(signInProvider: signInProvider)),
      child: StatefulBuilder(
        builder: (context, _) {
          return BlocConsumer<ExternalSignInBloc, ExternalSignInState>(
            listener: (context, externalSignInState) {
              if (externalSignInState.status == ExternalSignInStateStatus.submittingSuccess) {
                context.read<AuthBloc>().add(AuthCheckEvent());
              }
            },
            builder: (context, externalSignInState) => builder(
              context,
              externalSignInState,
              () => context.read<ExternalSignInBloc>().add(ExternalSignInSubmitEvent()),
              externalSignInState.status == ExternalSignInStateStatus.submitting,
            ),
          );
        },
      ),
    );
  }
}

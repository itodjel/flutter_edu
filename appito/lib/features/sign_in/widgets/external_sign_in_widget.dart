import 'package:appito/_all.dart';

class ExternalSignInWidget extends StatelessWidget {
  const ExternalSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ExternalSignInButton(
          signInProvider: SignInProvider.google,
          builder: (_, __, onTap, isLoading) {
            return Button(
              text: 'Google',
              isLoading: isLoading,
              onTap: onTap,
            );
          },
        ),
        const Gap(20),
        _ExternalSignInButton(
          signInProvider: SignInProvider.facebook,
          builder: (_, __, onTap, isLoading) {
            return Button(
              text: 'Facebook',
              isLoading: isLoading,
              onTap: onTap,
            );
          },
        ),
        const Gap(20),
        _ExternalSignInButton(
          signInProvider: SignInProvider.apple,
          builder: (_, __, onTap, isLoading) {
            return Button(
              text: 'Apple',
              isLoading: isLoading,
              onTap: onTap,
            );
          },
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

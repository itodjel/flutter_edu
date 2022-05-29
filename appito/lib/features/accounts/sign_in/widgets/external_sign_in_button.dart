import 'package:appito/_all.dart';

class ExternalSignInButton extends StatelessWidget {
  final SignInProvider signInProvider;
  final Widget Function(BuildContext, ExternalSignInState, VoidCallback onTap, bool isLoading) builder;

  const ExternalSignInButton({
    Key? key,
    required this.signInProvider,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<ExternalSignInBloc>(),
      child: AbstractFormConsumer<ExternalSignInBloc, ExternalSignInState, SignInWithExternalProviderRequestModel, SignInWithExternalProviderRequestModelValidator>(
        onInit: (_, __, init) {
          init(SignInWithExternalProviderRequestModel(signInProvider: signInProvider));
        },
        onSuccess: (context, _) {
          context.read<AuthBloc>().add(AuthCheckEvent());
        },
        extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) => builder(context, state, submit, state.isSubmitting),
      ),
    );
  }
}

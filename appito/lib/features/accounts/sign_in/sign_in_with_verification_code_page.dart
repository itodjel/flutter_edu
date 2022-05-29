import 'package:appito/_all.dart';

class SignInWithVerificationCodePage extends StatelessWidget {
  static const route = '/sign-in-with-verification-code';

  final SignInWithVerificationCodePageModel pageModel;

  const SignInWithVerificationCodePage({
    Key? key,
    required this.pageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<ExternalSignInBloc>(),
      child: AppScaffold(
        appBar: AppBar(title: const Text('Sign in with verification code')),
        body: _Form(pageModel: pageModel),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  final SignInWithVerificationCodePageModel pageModel;

  const _Form({
    Key? key,
    required this.pageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormConsumer<ExternalSignInBloc, ExternalSignInState, SignInWithExternalProviderRequestModel, SignInWithExternalProviderRequestModelValidator>(
      onInit: (_, __, init) {
        init(SignInWithExternalProviderRequestModel(signInProvider: pageModel.signInProvider, value: pageModel.value));
      },
      onSuccess: (context, _) {
        context.read<AuthBloc>().add(AuthCheckEvent());
        context.popUntilRoot();
      },
      onValidationError: (context, _) {
        context.toast.validation(message: context.translations.please_fill_in_all_required_fields);
      },
      extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) {
        return Form(
          autovalidateMode: state.autovalidateMode,
          child: Column(
            children: [
              const Gap(30),
              Text('Please enter the verification code that we sent via SMS to ${model.value}'),
              const Gap(30),
              TextFormField(
                initialValue: model.code,
                validator: (text) => modelValidator.code(model.copyWith(code: text)),
                onChanged: (text) => update(model.copyWith(code: text)),
                decoration: const InputDecoration(
                  hintText: 'xxxxxx',
                  label: Text('Verification code'),
                ),
              ),
              const Gap(30),
              Button(
                primary: true,
                isLoading: state.isSubmitting,
                text: 'Send verification code',
                onTap: submit,
              ),
            ],
          ),
        );
      },
    );
  }
}

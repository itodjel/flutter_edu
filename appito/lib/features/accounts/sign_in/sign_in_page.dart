import 'package:appito/_all.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => services.get<SignInBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text(context.translations.sign_in)),
        body: ListView(
          children: [
            const _Form(),
            Button(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              text: 'Sign Up',
              primary: true,
              onTap: () => context.push(SignUpPage.route),
            ),
            const Gap(20),
            const ExternalSignInWidget(),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormConsumer<SignInBloc, SignInState, SignInRequestModel, SignInRequestModelValidator>(
      onSuccess: (context, signInState) {
        context.read<AuthBloc>().add(AuthCheckEvent());
      },
      onValidationError: (context, signInState) {
        context.toast.validation(message: context.translations.please_fill_in_all_required_fields);
      },
      extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: model.userName,
                validator: (text) => modelValidator.userName(model.copyWith(userName: text)),
                onChanged: (text) => update(model.copyWith(userName: text)),
                decoration: const InputDecoration(labelText: 'Username or email'),
              ),
              const Gap(30),
              TextFormField(
                initialValue: model.password,
                validator: (text) => modelValidator.password(model.copyWith(password: text)),
                onChanged: (text) => update(model.copyWith(password: text)),
                decoration: InputDecoration(labelText: context.translations.password),
                obscureText: true,
              ),
              const Gap(50),
              Button(
                primary: true,
                text: context.translations.submit,
                isLoading: state.isSubmitting,
                onTap: submit,
              ),
            ],
          ),
        );
      },
    );
  }
}

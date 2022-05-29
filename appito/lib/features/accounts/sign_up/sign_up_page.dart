import 'package:appito/_all.dart';

class SignUpPage extends StatelessWidget {
  static const route = '/sign-up';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => services.get<SignUpBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text(context.translations.sign_in)),
        body: ListView(
          children: const [
            _Form(),
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
    return AbstractFormConsumer<SignUpBloc, SignUpState, SignUpRequestModel, SignUpRequestModelValidator>(
      onSuccess: (context, _) {
        context.toast.success(message: 'Successfully created a client account');
        context.pop();
      },
      onValidationError: (context, _) {
        context.toast.validation(message: context.translations.please_fill_in_all_required_fields);
      },
      extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: model.firstName,
                onChanged: (text) => update(model.copyWith(firstName: text)),
                decoration: const InputDecoration(labelText: 'First name'),
              ),
              const Gap(30),
              TextFormField(
                initialValue: model.lastName,
                onChanged: (text) => update(model.copyWith(lastName: text)),
                decoration: const InputDecoration(labelText: 'Last name'),
              ),
              const Gap(30),
              TextFormField(
                initialValue: model.email,
                validator: (text) => modelValidator.email(model.copyWith(userName: text)),
                onChanged: (text) => update(model.copyWith(email: text)),
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const Gap(30),
              TextFormField(
                initialValue: model.userName,
                validator: (text) => modelValidator.userName(model.copyWith(userName: text)),
                onChanged: (text) => update(model.copyWith(userName: text)),
                decoration: InputDecoration(labelText: context.translations.username),
              ),
              const Gap(30),
              TextFormField(
                initialValue: model.password,
                validator: (text) => modelValidator.password(model.copyWith(password: text)),
                onChanged: (text) => update(model.copyWith(password: text)),
                decoration: InputDecoration(labelText: context.translations.password),
                obscureText: true,
              ),
              const Gap(30),
              TextFormField(
                initialValue: model.passwordConfirmed,
                validator: (text) => modelValidator.passwordConfirmed(model.copyWith(passwordConfirmed: text)),
                onChanged: (text) => update(model.copyWith(passwordConfirmed: text)),
                decoration: const InputDecoration(labelText: 'Password confirmation'),
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

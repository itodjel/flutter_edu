import 'package:appito/_all.dart';

class ChangePasswordPage extends StatelessWidget {
  static const route = '/change-password';

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => services.get<ChangePasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Change your password')),
        body: const _Form(),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormConsumer<ChangePasswordBloc, ChangePasswordState, ChangePasswordRequestModel, ChangePasswordRequestModelValidator>(
      onSuccess: (context, _) {
        context.toast.success(message: 'Successfully changed password');
        context.pop();
      },
      onValidationError: (context, _) {
        context.toast.validation(message: context.translations.please_fill_in_all_required_fields);
      },
      extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) {
        return Form(
          autovalidateMode: state.autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          ),
        );
      },
    );
  }
}

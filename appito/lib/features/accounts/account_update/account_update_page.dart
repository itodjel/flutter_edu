import 'package:appito/_all.dart';

class AccountUpdatePage extends StatelessWidget {
  static const route = '/edit-profile';

  const AccountUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => services.get<AccountUpdateBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit profile')),
        body: const _Form(),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormConsumer<AccountUpdateBloc, AccountUpdateState, AccountUpdateRequestModel, AccountUpdateRequestModelValidator>(
      onSuccess: (context, _) {
        context.toast.success(message: 'Successfully edited profile');
        context.pop();
      },
      onValidationError: (context, _) {
        context.toast.validation(message: context.translations.please_fill_in_all_required_fields);
      },
      extendedBuilder: (context, accountUpdateState, model, modelValidator, bloc, update, submit) {
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
              const Gap(20),
              TextFormField(
                initialValue: model.lastName,
                onChanged: (text) => update(model.copyWith(lastName: text)),
                decoration: const InputDecoration(labelText: 'Last name'),
              ),
              const Gap(20),
              TextFormField(
                initialValue: model.userName,
                validator: (text) => modelValidator.userName(model.copyWith(userName: text)),
                onChanged: (text) => update(model.copyWith(userName: text)),
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const Gap(20),
              TextFormField(
                initialValue: model.email,
                validator: (text) => modelValidator.email(model.copyWith(email: text)),
                onChanged: (text) => update(model.copyWith(email: text)),
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const Gap(20),
              Button(
                primary: true,
                text: 'Save',
                isLoading: accountUpdateState.isSubmitting,
                onTap: submit,
              ),
            ],
          ),
        );
      },
    );
  }
}

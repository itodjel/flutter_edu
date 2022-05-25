import 'package:appito/_all.dart';

class SignInWithPhoneNumberPage extends StatelessWidget {
  static const route = '/sign-in-with-phone-number';

  final SignInWithPhoneNumberPageModel model;

  const SignInWithPhoneNumberPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<SignInWithPhoneNumberBloc>(),
      child: AppScaffold(
        appBar: AppBar(title: const Text('Sign in with phone number')),
        body: _Form(model: model),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  final SignInWithPhoneNumberPageModel model;

  const _Form({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  @override
  void initState() {
    context.read<SignInWithPhoneNumberBloc>().add(SignInWithPhoneNumberInitEvent(phoneNumber: widget.model.phoneNumber));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInWithPhoneNumberBloc, SignInWithPhoneNumberState>(
      listener: (context, signInWithPhoneNumberState) {
        if (signInWithPhoneNumberState.status == SignInWithPhoneNumberStateStatus.submittingSuccess) {
          context.read<AuthBloc>().add(AuthCheckEvent());
          context.popUntilRoot();
        } else if (signInWithPhoneNumberState.status == SignInWithPhoneNumberStateStatus.validationError) {
          context.toast.validation(message: context.translations.please_fill_in_all_required_fields);
        }
      },
      builder: (context, signInWithPhoneNumberState) {
        return Form(
          autovalidateMode: signInWithPhoneNumberState.autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            children: [
              const Gap(30),
              Text('Please enter the verification code that we sent via SMS to ${signInWithPhoneNumberState.model.phoneNumber}'),
              const Gap(30),
              TextFormField(
                initialValue: signInWithPhoneNumberState.model.phoneNumber,
                onChanged: (text) => context.read<SignInWithPhoneNumberBloc>().add(SignInWithPhoneNumberUpdateEvent(model: signInWithPhoneNumberState.model.copyWith(code: text))),
                validator: (text) => signInWithPhoneNumberState.modelvalidator?.phoneNumber(signInWithPhoneNumberState.model.copyWith(code: text)),
                decoration: const InputDecoration(
                  hintText: 'xxxxxx',
                  label: Text('Verification code'),
                ),
              ),
              const Gap(30),
              Button(
                primary: true,
                isLoading: signInWithPhoneNumberState.status == SignInWithPhoneNumberStateStatus.submitting,
                text: 'Send verification code',
                onTap: () => context.read<SignInWithPhoneNumberBloc>().add(SignInWithPhoneNumberSubmitEvent()),
              ),
            ],
          ),
        );
      },
    );
  }
}

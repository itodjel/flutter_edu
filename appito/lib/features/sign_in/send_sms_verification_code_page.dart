import 'package:appito/_all.dart';

class SendSMSVerificationCodePage extends StatelessWidget {
  static const route = '/send-sms-verification-code';

  const SendSMSVerificationCodePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<SendSMSVerificationCodeBloc>(),
      child: AppScaffold(
        appBar: AppBar(title: const Text('Sign in with phone number')),
        body: const _Form(),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  @override
  void initState() {
    context.read<SendSMSVerificationCodeBloc>().add(SendSMSVerificationCodeInitEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendSMSVerificationCodeBloc, SendSMSVerificationCodeState>(
      listener: (context, sendSMSVerificationCodeState) {
        if (sendSMSVerificationCodeState.status == SendSMSVerificationCodeStateStatus.submittingSuccess) {
          context.push(SignInWithPhoneNumberPage.route, SignInWithPhoneNumberPageModel(phoneNumber: sendSMSVerificationCodeState.model.phoneNumber.value));
        } else if (sendSMSVerificationCodeState.status == SendSMSVerificationCodeStateStatus.validationError) {
          context.toast.validation(message: context.translations.please_fill_in_all_required_fields);
        }
      },
      builder: (context, sendSMSVerificationCodeState) {
        return Form(
          autovalidateMode: sendSMSVerificationCodeState.autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            children: [
              const Gap(30),
              const Text('Please enter your phone number so we can send you a verification code via SMS'),
              const Gap(30),
              TextFormField(
                initialValue: sendSMSVerificationCodeState.model.phoneNumber,
                onChanged: (text) => context.read<SendSMSVerificationCodeBloc>().add(SendSMSVerificationCodeUpdateEvent(model: sendSMSVerificationCodeState.model.copyWith(phoneNumber: text))),
                validator: (text) => sendSMSVerificationCodeState.modelvalidator?.phoneNumber(sendSMSVerificationCodeState.model.copyWith(phoneNumber: text)),
                decoration: const InputDecoration(
                  hintText: '+387 61 123 456',
                  label: Text('Phone Number'),
                ),
              ),
              const Gap(30),
              Button(
                primary: true,
                isLoading: sendSMSVerificationCodeState.status == SendSMSVerificationCodeStateStatus.submitting,
                text: 'Send verification code',
                onTap: () => context.read<SendSMSVerificationCodeBloc>().add(SendSMSVerificationCodeSubmitEvent()),
              ),
            ],
          ),
        );
      },
    );
  }
}

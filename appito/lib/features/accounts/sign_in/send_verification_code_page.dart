import 'package:appito/_all.dart';

class SendVerificationCodePage extends StatelessWidget {
  static const route = '/send-verification-code';

  final SendVerificationCodePageModel pageModel;

  const SendVerificationCodePage({
    Key? key,
    required this.pageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => services.get<SendVerificationCodeBloc>(),
      child: AppScaffold(
        appBar: AppBar(title: const Text('Sign in with verification code')),
        body: _Form(pageModel: pageModel),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  final SendVerificationCodePageModel pageModel;

  const _Form({
    Key? key,
    required this.pageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormConsumer<SendVerificationCodeBloc, SendVerificationCodeState, SendVerificationCodeRequestModel, SendVerificationCodeRequestModelValidator>(
      onInit: (context, bloc, init) => init(SendVerificationCodeRequestModel(type: pageModel.type)),
      onSuccess: (context, state) {
        context.push(
          SignInWithVerificationCodePage.route,
          SignInWithVerificationCodePageModel(
            value: state.model?.source ?? '',
            signInProvider: () {
              switch (state.model?.type) {
                case VerificationCodeSourceType.email:
                  return SignInProvider.email;
                case VerificationCodeSourceType.phoneNumber:
                  return SignInProvider.phoneNumber;
                default:
                  return SignInProvider.email;
              }
            }(),
          ),
        );
      },
      onValidationError: (context, _) {
        context.toast.validation(message: context.translations.please_fill_in_all_required_fields);
      },
      extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) {
        return Column(
          children: [
            if (pageModel.allowTypeToggle) ...{
              const _VerificationCodeSourceTypeSelectionWidget(),
              const Gap(30),
            },
            Column(
              children: [
                const Gap(30),
                const _Title(),
                const Gap(30),
                const _TextFormField(),
                const Gap(30),
                Button(
                  primary: true,
                  isLoading: state.isSubmitting,
                  text: 'Send verification code',
                  onTap: submit,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _TextFormField extends StatelessWidget {
  const _TextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormConsumer<SendVerificationCodeBloc, SendVerificationCodeState, SendVerificationCodeRequestModel, SendVerificationCodeRequestModelValidator>(
      extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) {
        return TextFormField(
          initialValue: model.source,
          validator: (text) => modelValidator.source(model.copyWith(source: text)),
          onChanged: (text) => update(model.copyWith(source: text)),
          decoration: () {
            switch (model.type) {
              case VerificationCodeSourceType.email:
                return const InputDecoration(
                  hintText: 'someone@example.com',
                  label: Text('Email'),
                );
              case VerificationCodeSourceType.phoneNumber:
                return const InputDecoration(
                  hintText: '+387 61 123 456',
                  label: Text('Phone Number'),
                );
              default:
                return null;
            }
          }(),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormConsumer<SendVerificationCodeBloc, SendVerificationCodeState, SendVerificationCodeRequestModel, SendVerificationCodeRequestModelValidator>(
      extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) {
        switch (model.type) {
          case VerificationCodeSourceType.email:
            return const Text('Please enter your email so we can send you a verification code');
          case VerificationCodeSourceType.phoneNumber:
            return const Text('Please enter your phone number so we can send you a verification code via SMS');
          default:
            return const Text('Invalid verification code source type selected');
        }
      },
    );
  }
}

class _VerificationCodeSourceTypeSelectionWidget extends StatelessWidget {
  const _VerificationCodeSourceTypeSelectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormConsumer<SendVerificationCodeBloc, SendVerificationCodeState, SendVerificationCodeRequestModel, SendVerificationCodeRequestModelValidator>(
      extendedBuilder: (context, state, model, modelValidator, bloc, update, submit) {
        return Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text('Email'),
                groupValue: model.type,
                value: VerificationCodeSourceType.email,
                onChanged: (VerificationCodeSourceType? value) {
                  context.read<SendVerificationCodeBloc>().add(AbstractFormInitEvent(model: model.copyWith(type: VerificationCodeSourceType.email)));
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: const Text('Phone number'),
                groupValue: model.type,
                value: VerificationCodeSourceType.phoneNumber,
                onChanged: (VerificationCodeSourceType? value) {
                  context.read<SendVerificationCodeBloc>().add(AbstractFormInitEvent(model: model.copyWith(type: VerificationCodeSourceType.phoneNumber)));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

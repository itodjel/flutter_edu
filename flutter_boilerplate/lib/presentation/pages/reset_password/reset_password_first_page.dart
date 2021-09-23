import 'package:flutter_boilerplate/_all.dart';

class ResetPasswordPage extends StatefulWidget {
  static const route = '/ResetPasswordPage';

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        actions: [
          IconButton(
            onPressed: () => context.navigator.pop(),
            icon: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, resetPasswordState) {
          if (resetPasswordState.status == ResetPasswordStateStatus.emailSubmittingSuccess) {
            context.navigator.pushNamed(ResetPasswordSecondPage.route);
          } else if (resetPasswordState.status == ResetPasswordStateStatus.validatingEmail) {
            if (formKey.currentState?.validate() ?? false) {
              context.read<ResetPasswordBloc>().add(ResetPasswordSubmitEmailEvent());
            } else {
              showInfoMessage(context.localizer.translations.pleaseFillInAllRequiredFields);
            }
          }
        },
        builder: (context, resetPasswordState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
              child: ListView(
                children: const [
                  Spacing.verticalL(2),
                  _ResetPasswordText(),
                  Spacing.verticalL(2),
                  _DescriptionText(),
                  Spacing.verticalL(),
                  _EmailTextField(),
                  Spacing.verticalL(3),
                  _SubmitButton(),
                  Spacing.verticalL(),
                  _CancelButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ResetPasswordText extends StatelessWidget {
  const _ResetPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizer.translations.resetPassword,
      style: TextStyle(
        color: context.theme.primaryColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizer.translations.resetPasswordDescriptionText,
      softWrap: true,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, resetPasswordState) {
        return TextFormField(
          initialValue: resetPasswordState.model.email,
          onChanged: (text) => context.resetPasswordBloc.add(ResetPasswordUpdateEvent(model: resetPasswordState.model.copyWith(email: Optional(text)))),
          validator: (text) {
            if (text.value.isEmpty || !text.value.isEmail) {
              return 'Email must be in correct format!';
            }
          },
          decoration: InputDecoration(
              hintText: context.localizer.translations.email,
              hintStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(204, 204, 204, 1),
              )),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, resetPasswordState) {
        return Button(
          color: context.theme.primaryColor,
          textColor: Colors.white,
          text: context.localizer.translations.submit,
          isLoading: resetPasswordState.status == ResetPasswordStateStatus.emailSubmitting,
          onTap: () => context.resetPasswordBloc.add(ResetPasswordEmailValidateEvent()),
        );
      },
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      color: Colors.white,
      textColor: context.theme.primaryColor,
      text: context.localizer.translations.cancel,
      borderColor: context.theme.primaryColor,
      onTap: () => context.navigator.pop(),
    );
  }
}

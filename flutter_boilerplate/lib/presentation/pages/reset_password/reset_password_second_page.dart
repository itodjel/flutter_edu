import 'package:flutter_boilerplate/_all.dart';

class ResetPasswordSecondPage extends StatefulWidget {
  static const route = '/ResetPasswordSecondPage';

  @override
  _ResetPasswordSecondPageState createState() => _ResetPasswordSecondPageState();
}

class _ResetPasswordSecondPageState extends State<ResetPasswordSecondPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, resetPasswordState) {
          if (resetPasswordState.submittedOnce) {
            formKey.currentState?.validate();
          }
          if (resetPasswordState.status == ResetPasswordStateStatus.submittingSuccess) {
            showInfoMessage(context.localizer.translations.profileUpdatedSuccessfully);
            context.navigator.resetAndPushNamed(SignInPage.route);
          } else if (resetPasswordState.status == ResetPasswordStateStatus.validating) {
            if ((formKey.currentState?.validate() ?? false) && context.resetPasswordModelValidator.validate(resetPasswordState.model)) {
              context.read<ResetPasswordBloc>().add(ResetPasswordSubmitEvent());
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
                  Spacing.verticalS(),
                  _EmailText(),
                  Spacing.verticalL(),
                  _CodeTextField(),
                  Spacing.verticalL(),
                  _NewPasswordTextField(),
                  Spacing.verticalL(),
                  _PasswordConfirmationTextField(),
                  Spacing.verticalL(3),
                  _ChangePasswordButton(),
                  Spacing.verticalL(),
                  _CancelButton(),
                  Spacing.verticalL(4),
                  _DidntReceiveCode(),
                  Spacing.verticalS(),
                  _ResendCode(),
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
        fontSize: 32,
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
      context.localizer.translations.pleaseEnterVerificationCodeSentTo,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}

class _EmailText extends StatelessWidget {
  const _EmailText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, resetPasswordState) {
        return Text(
          resetPasswordState.model.email.value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: context.theme.primaryColor,
          ),
        );
      },
    );
  }
}

class _CodeTextField extends StatelessWidget {
  const _CodeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, resetPasswordState) {
        return TextFormField(
          initialValue: resetPasswordState.model.code,
          onChanged: (text) => context.resetPasswordBloc.add(ResetPasswordUpdateEvent(model: resetPasswordState.model.copyWith(code: Optional(text)))),
          validator: (text) => context.resetPasswordModelValidator.code(resetPasswordState.model.copyWith(code: Optional(text))),
          decoration: InputDecoration(
              hintText: context.localizer.translations.code,
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

class _NewPasswordTextField extends StatefulWidget {
  const _NewPasswordTextField({Key? key}) : super(key: key);

  @override
  __NewPasswordTextFieldState createState() => __NewPasswordTextFieldState();
}

class __NewPasswordTextFieldState extends State<_NewPasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, resetPasswordState) {
        return TextFormField(
          initialValue: resetPasswordState.model.newPassword,
          validator: (text) => context.resetPasswordModelValidator.newPassword(resetPasswordState.model.copyWith(newPassword: Optional(text))),
          onChanged: (text) => context.resetPasswordBloc.add(ResetPasswordUpdateEvent(model: resetPasswordState.model.copyWith(newPassword: Optional(text)))),
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: context.translations.newPassword,
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(204, 204, 204, 1),
            ),
            suffixIcon: InkWell(
              onTap: () => setState(() => obscureText = !obscureText),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: obscureText
                    ? Text(
                        context.localizer.translations.show.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: context.appTheme.neutral1,
                        ),
                      )
                    : Text(
                        context.localizer.translations.hide.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: context.appTheme.neutral3,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PasswordConfirmationTextField extends StatefulWidget {
  const _PasswordConfirmationTextField({Key? key}) : super(key: key);

  @override
  __PasswordConfirmationTextFieldState createState() => __PasswordConfirmationTextFieldState();
}

class __PasswordConfirmationTextFieldState extends State<_PasswordConfirmationTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, resetPasswordState) {
        return TextFormField(
          initialValue: resetPasswordState.model.passwordConfirmation,
          validator: (text) => context.resetPasswordModelValidator.passwordConfirmation(resetPasswordState.model.copyWith(passwordConfirmation: Optional(text))),
          onChanged: (text) => context.resetPasswordBloc.add(ResetPasswordUpdateEvent(model: resetPasswordState.model.copyWith(passwordConfirmation: Optional(text)))),
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: context.translations.retypePassword,
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(204, 204, 204, 1),
            ),
            suffixIcon: InkWell(
              onTap: () => setState(() => obscureText = !obscureText),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: obscureText
                    ? Text(
                        context.localizer.translations.show.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: context.appTheme.neutral1,
                        ),
                      )
                    : Text(
                        context.localizer.translations.hide.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: context.appTheme.neutral3,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ChangePasswordButton extends StatelessWidget {
  const _ChangePasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, resetPasswordState) {
        return Button(
          color: context.theme.primaryColor,
          textColor: Colors.white,
          text: context.localizer.translations.submit,
          isLoading: resetPasswordState.status == ResetPasswordStateStatus.submitting,
          onTap: () => context.resetPasswordBloc.add(ResetPasswordValidateEvent()),
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

class _DidntReceiveCode extends StatelessWidget {
  const _DidntReceiveCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizer.translations.didntReceiveCode,
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}

class _ResendCode extends StatelessWidget {
  const _ResendCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.resetPasswordBloc.add(ResetPasswordSubmitEmailEvent()),
      child: Text(
        context.localizer.translations.resendCode,
        style: TextStyle(
          color: context.theme.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

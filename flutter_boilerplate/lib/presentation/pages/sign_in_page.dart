import 'package:flutter_boilerplate/_all.dart';

class SignInPage extends StatefulWidget {
  static const route = '/SignInPage';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        actions: [
          IconButton(
            onPressed: () {
              context.navigator.pop();
            },
            icon: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey,
              ),
              child: const Icon(Icons.close, color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: context.appTheme.pageContentPadding,
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, signInState) {
            if (signInState.submittedOnce) {
              formKey.currentState?.validate();
            }
            if (signInState.status == SignInStateStatus.validating) {
              showInfoMessage('Please fill in all required fields before submitting');
            }
          },
          child: ListView(
            children: [
              const AppLogo.big(),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: context.theme.primaryColor,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _WelcomeText(),
                        Spacing.verticalL(),
                        _EmailWidget(),
                        Spacing.verticalL(),
                        _PasswordWidget(),
                        Spacing.verticalL(2),
                        _ForgotPasswordWidget(),
                        Spacing.verticalL(),
                        _SignInButton(),
                        Spacing.verticalL(2),
                        _NewToFlutterBoilerplateWidget(),
                        Spacing.verticalM(),
                        _CreateAccountWidget(),
                        Spacing.verticalM(),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacing.verticalL(4),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.translations.welcome}!',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: context.theme.primaryColor,
      ),
    );
  }
}

class _EmailWidget extends StatelessWidget {
  const _EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.translations.logInToFlutterBoilerplate,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Spacing.verticalL(2),
        BlocBuilder<SignInBloc, SignInState>(
          builder: (context, signInState) {
            return TextFormField(
              initialValue: signInState.model.userNameOrEmail,
              validator: (text) => context.signInModelValidator.userNameOrEmail(signInState.model.copyWith(userNameOrEmail: Optional(text))),
              onChanged: (text) => context.signInBloc.add(SignInUpdateEvent(model: signInState.model.copyWith(userNameOrEmail: Optional(text)))),
              decoration: InputDecoration(hintText: context.translations.email),
            );
          },
        ),
      ],
    );
  }
}

class _PasswordWidget extends StatefulWidget {
  const _PasswordWidget({Key? key}) : super(key: key);

  @override
  __PasswordWidgetState createState() => __PasswordWidgetState();
}

class __PasswordWidgetState extends State<_PasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, signInState) {
        return TextFormField(
          initialValue: signInState.model.password,
          validator: (text) => context.signInModelValidator.password(signInState.model.copyWith(password: Optional(text))),
          onChanged: (text) => context.signInBloc.add(SignInUpdateEvent(model: signInState.model.copyWith(password: Optional(text)))),
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: Localizer.of(context).translations.password,
            //hintText: context.localizer.translations.password,
            //hintText: context.translations.password,
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

class _ForgotPasswordWidget extends StatelessWidget {
  const _ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.navigator.pushNamed(ResetPasswordPage.route),
      child: Text(
        '${context.translations.forgotPassword}?',
        style: TextStyle(
          color: context.theme.primaryColor,
          fontSize: 12,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, signInState) {
        return Button(
          color: context.theme.primaryColor,
          textColor: Colors.white,
          text: context.translations.signIn,
          isLoading: signInState.status == SignInStateStatus.submitting,
          onTap: () => context.signInBloc.add(SignInSubmitEvent()),
        );
      },
    );
  }
}

class _NewToFlutterBoilerplateWidget extends StatelessWidget {
  const _NewToFlutterBoilerplateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${context.translations.newToFlutterBoilerplate}?',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

class _CreateAccountWidget extends StatelessWidget {
  const _CreateAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => context.navigator.pushNamed(
          RegisterPage.route,
          arguments: RegisterPageModel(
            onSuccess: () {
              context.navigator.resetAndPushNamed(SignInPage.route);

              showInfoDialog(message: context.translations.successfullyCreatedAnAccount);
            },
          ),
        ),
        child: Text(
          context.translations.createAccount,
          style: TextStyle(
            color: context.theme.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

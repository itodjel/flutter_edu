import 'package:flutter_boilerplate/_all.dart';

class LoginPage extends StatefulWidget {
  static const route = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              context.pop();
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
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, loginState) {
            if (loginState.submittedOnce) {
              formKey.currentState?.validate();
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
                        _LoginText(),
                        Spacing.verticalL(2),
                        _EmailWidget(),
                        Spacing.verticalL(),
                        _PasswordWidget(),
                        Spacing.verticalL(2),
                        _ForgotPasswordWidget(),
                        Spacing.verticalL(),
                        _LoginButton(),
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

class _LoginText extends StatelessWidget {
  const _LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.translations.logInToFlutterBoilerplate,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}

class _EmailWidget extends StatelessWidget {
  const _EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        return TextFormField(
          initialValue: loginState.model.userNameOrEmail,
          validator: (text) => context.loginModelValidator.userNameOrEmail(loginState.model.copyWith(userNameOrEmail: Optional(text))),
          onChanged: (text) => context.loginBloc.add(LoginUpdateEvent(model: loginState.model.copyWith(userNameOrEmail: Optional(text)))),
          decoration: InputDecoration(hintText: context.translations.email),
        );
      },
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
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        return TextFormField(
          initialValue: loginState.model.password,
          validator: (text) => context.loginModelValidator.password(loginState.model.copyWith(password: Optional(text))),
          onChanged: (text) => context.loginBloc.add(LoginUpdateEvent(model: loginState.model.copyWith(password: Optional(text)))),
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: context.translations.password,
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
      onTap: () => context.pushPage(ResetPassword()),
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

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        return Button(
          color: context.theme.primaryColor,
          textColor: Colors.white,
          text: context.translations.login,
          isLoading: loginState.status == LoginStateStatus.submitting,
          onTap: () => context.loginBloc.add(LoginValidateEvent()),
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
        onTap: () => context.pushPage(
          RegisterPage(
            onSuccess: () {
              context.popTimes(2);
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

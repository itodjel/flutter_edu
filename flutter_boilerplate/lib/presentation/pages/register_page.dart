import 'package:flutter_boilerplate/_all.dart';
import 'package:flutter_boilerplate/presentation/pages/_all.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/RegisterPage';

  final RegisterPageModel? model;

  RegisterPage({this.model});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordConfirmationVisible = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, registerState) {
          if (registerState.submittedOnce) {
            formKey.currentState?.validate();
          }
          if (registerState.status == RegisterStateStatus.submittingSuccess) {
            if (widget.model?.onSuccess != null) {
              widget.model!.onSuccess!();
            }
          } else if (registerState.status == RegisterStateStatus.validating) {
            if ((formKey.currentState?.validate() ?? false) && context.registerModelValidator.validate(registerState.model)) {
              context.registerBloc.add(RegisterSubmitEvent());
            } else {
              showInfoMessage(context.localizer.translations.pleaseFillInAllRequiredFields);
            }
          }
        },
        child: Padding(
          padding: context.appTheme.pageContentPadding,
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
                        _RegisterText(),
                        Spacing.verticalL(2),
                        _ProfilePhotoWidget(),
                        Spacing.verticalL(),
                        _EmailWidget(),
                        Spacing.verticalL(),
                        _FirstNameWidget(),
                        Spacing.verticalL(),
                        _LastNameWidget(),
                        Spacing.verticalL(),
                        _PasswordWidget(),
                        Spacing.verticalL(),
                        _PasswordConfirmationWidget(),
                        Spacing.verticalL(2),
                        _CreateAccountButton(),
                        Spacing.verticalL(2),
                        _AlreadyHaveAnAccountWidget(),
                        Spacing.verticalM(),
                        _SignInButton(),
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

class _RegisterText extends StatelessWidget {
  const _RegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.translations.registerToFlutterBoilerplate,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}

class _ProfilePhotoWidget extends StatelessWidget {
  const _ProfilePhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: context.appTheme.grey1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: InkWell(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => Column(
                        children: [
                          Expanded(
                            child: Gallery(
                              allowMultiple: false,
                              onSelect: (BuildContext context) {
                                context.registerBloc.add(RegisterUpdateEvent(model: registerState.model.copyWith(logo: Optional(context.read<GalleryBloc>().state.selectedItems.firstOrDefault()?.file))));
                                context.navigator.popTimes(2);
                              },
                            ),
                          ),
                          GalleryControls(
                            onSelect: (BuildContext context) {
                              context.registerBloc.add(RegisterUpdateEvent(model: registerState.model.copyWith(logo: Optional(context.read<GalleryBloc>().state.selectedItems.firstOrDefault()?.file))));
                              context.navigator.pop();
                            },
                          ),
                        ],
                      ),
                    ),
                    child: () {
                      if (registerState.model.logo != null) {
                        return Container(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(fit: BoxFit.cover, image: FileImage(registerState.model.logo!)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        );
                      }
                      if (registerState.model.logoUrl != null) {
                        return Container(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: registerState.model.logoUrl!.toNetworkImageUrl(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }

                      return Text(
                        'Add photo',
                        //context.localizer.translations.addPhoto,
                        style: TextStyle(
                          color: context.appTheme.grey2,
                        ),
                      );
                    }(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Yea',
                //context.localizer.translations.forBestResultsUseThisRatio,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 8,
                  color: context.appTheme.grey2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EmailWidget extends StatelessWidget {
  const _EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return TextFormField(
          initialValue: registerState.model.email,
          validator: (text) => context.registerModelValidator.email(registerState.model.copyWith(email: Optional(text))),
          onChanged: (text) => context.registerBloc.add(RegisterUpdateEvent(model: registerState.model.copyWith(email: Optional(text)))),
          decoration: InputDecoration(hintText: context.localizer.translations.email),
        );
      },
    );
  }
}

class _FirstNameWidget extends StatelessWidget {
  const _FirstNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return TextFormField(
          initialValue: registerState.model.firstName,
          validator: (text) => context.registerModelValidator.firstName(registerState.model.copyWith(firstName: Optional(text))),
          onChanged: (text) => context.registerBloc.add(RegisterUpdateEvent(model: registerState.model.copyWith(firstName: Optional(text)))),
          decoration: InputDecoration(hintText: context.localizer.translations.firstName),
        );
      },
    );
  }
}

class _LastNameWidget extends StatelessWidget {
  const _LastNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return TextFormField(
          initialValue: registerState.model.lastName,
          validator: (text) => context.registerModelValidator.lastName(registerState.model.copyWith(lastName: Optional(text))),
          onChanged: (text) => context.registerBloc.add(RegisterUpdateEvent(model: registerState.model.copyWith(lastName: Optional(text)))),
          decoration: InputDecoration(hintText: context.localizer.translations.lastName),
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
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return TextFormField(
          initialValue: registerState.model.password,
          validator: (text) => context.registerModelValidator.password(registerState.model.copyWith(password: Optional(text))),
          onChanged: (text) => context.registerBloc.add(RegisterUpdateEvent(model: registerState.model.copyWith(password: Optional(text)))),
          obscureText: !passwordVisible,
          decoration: InputDecoration(
              hintText: context.localizer.translations.password,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: passwordVisible
                      ? Text(
                          context.localizer.translations.hide.toUpperCase(),
                          style: TextStyle(fontSize: 10, color: context.appTheme.neutral1),
                        )
                      : Text(
                          context.localizer.translations.show.toUpperCase(),
                          style: TextStyle(fontSize: 10, color: context.appTheme.neutral3),
                        ),
                ),
              )),
        );
      },
    );
  }
}

class _PasswordConfirmationWidget extends StatefulWidget {
  const _PasswordConfirmationWidget({Key? key}) : super(key: key);

  @override
  __PasswordConfirmationWidgetState createState() => __PasswordConfirmationWidgetState();
}

class __PasswordConfirmationWidgetState extends State<_PasswordConfirmationWidget> {
  bool passwordConfirmationVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return TextFormField(
          initialValue: registerState.model.passwordConfirmation,
          validator: (text) => context.registerModelValidator.passwordConfirmation(registerState.model.copyWith(passwordConfirmation: Optional(text))),
          onChanged: (text) => context.registerBloc.add(RegisterUpdateEvent(model: registerState.model.copyWith(passwordConfirmation: Optional(text)))),
          obscureText: !passwordConfirmationVisible,
          decoration: InputDecoration(
              hintText: context.localizer.translations.retypePassword,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    passwordConfirmationVisible = !passwordConfirmationVisible;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: passwordConfirmationVisible
                      ? Text(
                          context.localizer.translations.hide.toUpperCase(),
                          style: TextStyle(fontSize: 10, color: context.appTheme.neutral1),
                        )
                      : Text(
                          context.localizer.translations.show.toUpperCase(),
                          style: TextStyle(fontSize: 10, color: context.appTheme.neutral3),
                        ),
                ),
              )),
        );
      },
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return Button(
          color: context.theme.primaryColor,
          textColor: Colors.white,
          text: context.translations.createAccount,
          isLoading: registerState.status == RegisterStateStatus.submitting,
          onTap: () => context.registerBloc.add(RegisterValidateEvent()),
        );
      },
    );
  }
}

class _AlreadyHaveAnAccountWidget extends StatelessWidget {
  const _AlreadyHaveAnAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.localizer.translations.alreadyHaveAnAccount,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => context.navigator.pop(),
        child: Text(
          context.localizer.translations.logIn,
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

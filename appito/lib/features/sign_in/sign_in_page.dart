import 'package:appito/_all.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => services.get<SignInBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text(context.translations.sign_in)),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();

    context.read<SignInBloc>().add(SignInInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, signInState) {
        if (signInState.status == SignInStateStatus.submittingSuccess) {
          context.read<AuthBloc>().add(AuthCheckEvent());
        } else if (signInState.status == SignInStateStatus.validationError) {
          toast.validation(message: context.translations.please_fill_in_all_required_fields);
        }
      },
      builder: (context, signInState) {
        if (signInState.status == SignInStateStatus.initializing) {
          return const Loader();
        }

        return Form(
          autovalidateMode: signInState.autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: signInState.model.userName,
                  validator: (text) => services.get<SignInRequestModelValidator>().userName(signInState.model.copyWith(userName: text)),
                  onChanged: (text) => context.read<SignInBloc>().add(SignInUpdateEvent(model: signInState.model.copyWith(userName: text))),
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                const Gap(30),
                TextFormField(
                  initialValue: signInState.model.password,
                  validator: (text) => services.get<SignInRequestModelValidator>().password(signInState.model.copyWith(password: text)),
                  onChanged: (text) => context.read<SignInBloc>().add(SignInUpdateEvent(model: signInState.model.copyWith(password: text))),
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const Gap(50),
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, themeState) {
                    return Button(
                      text: 'Submit',
                      isLoading: signInState.status == SignInStateStatus.submitting,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

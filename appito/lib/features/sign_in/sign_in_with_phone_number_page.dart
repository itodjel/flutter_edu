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
    return AppScaffold(
      appBar: AppBar(title: const Text('Sign in with phone number')),
      body: Center(child: Text(model.text)),
    );
  }
}

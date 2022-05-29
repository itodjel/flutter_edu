import 'package:appito/_all.dart';

class BecomeAPartnerPage extends StatelessWidget {
  static const route = '/beocme-a-partner';

  const BecomeAPartnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => services.get<BecomeAPartnerBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Become a partner')),
        body: const _Form(),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractFormBuilder<BecomeAPartnerBloc, BecomeAPartnerState>(
      onSuccess: (context, _) {
        context.toast.success(message: 'Successfully edited profile');
        context.pop();
      },
      extendedBuilder: (context, state, bloc, submit) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                primary: true,
                text: 'Become a partner',
                isLoading: state.isSubmitting,
                onTap: submit,
              ),
            ],
          ),
        );
      },
    );
  }
}

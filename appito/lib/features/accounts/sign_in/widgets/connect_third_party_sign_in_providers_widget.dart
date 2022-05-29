import 'package:appito/_all.dart';

class ConnectThirdPartySignInProvidersWidget extends StatelessWidget {
  const ConnectThirdPartySignInProvidersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 3,
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AbstractItemConsumer<AccountBloc, AccountState, AccountResponseModel>(
          builder: (context, state, item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Connect sign in providers',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const Gap(20),
                if (context.platform.isGoogleSignInAvailable) ...{
                  ExternalSignInButton(
                    signInProvider: SignInProvider.google,
                    builder: (_, __, onTap, isLoading) {
                      return Button(
                        onTap: onTap,
                        child: Row(
                          children: [
                            const Expanded(child: Text('Google', style: TextStyle(fontWeight: FontWeight.w400))),
                            if (state.isThirdPartySignInProviderConnected(SignInProvider.google)) const Icon(Icons.check),
                            if (isLoading) const Loader.sm(),
                          ],
                        ),
                      );
                    },
                  ),
                  const Gap(20)
                },
                if (context.platform.isFacebookSignInAvailable) ...{
                  ExternalSignInButton(
                    signInProvider: SignInProvider.facebook,
                    builder: (_, __, onTap, isLoading) {
                      return Button(
                        onTap: onTap,
                        child: Row(
                          children: [
                            const Expanded(child: Text('Facebook', style: TextStyle(fontWeight: FontWeight.w400))),
                            if (state.isThirdPartySignInProviderConnected(SignInProvider.facebook)) const Icon(Icons.check),
                            if (isLoading) const Loader.sm(),
                          ],
                        ),
                      );
                    },
                  ),
                  const Gap(20),
                },
                if (context.platform.isAppleSignInAvailable) ...{
                  ExternalSignInButton(
                    signInProvider: SignInProvider.apple,
                    builder: (_, __, onTap, isLoading) {
                      return Button(
                        onTap: onTap,
                        child: Row(
                          children: [
                            const Expanded(child: Text('Apple', style: TextStyle(fontWeight: FontWeight.w400))),
                            if (state.isThirdPartySignInProviderConnected(SignInProvider.apple)) const Icon(Icons.check),
                            if (isLoading) const Loader.sm(),
                          ],
                        ),
                      );
                    },
                  ),
                  const Gap(20),
                },
                Button(
                  onTap: () => context.push(
                    SendVerificationCodePage.route,
                    SendVerificationCodePageModel(
                      allowTypeToggle: false,
                      type: VerificationCodeSourceType.email,
                      source: item.email,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Expanded(child: Text('Email', style: TextStyle(fontWeight: FontWeight.w400))),
                      if (state.isThirdPartySignInProviderConnected(SignInProvider.email)) const Icon(Icons.check),
                    ],
                  ),
                ),
                const Gap(20),
                Button(
                  onTap: () => context.push(
                    SendVerificationCodePage.route,
                    SendVerificationCodePageModel(
                      allowTypeToggle: false,
                      type: VerificationCodeSourceType.phoneNumber,
                      source: item.phoneNumber,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Expanded(child: Text('Phone number', style: TextStyle(fontWeight: FontWeight.w400))),
                      if (state.isThirdPartySignInProviderConnected(SignInProvider.phoneNumber)) const Icon(Icons.check),
                    ],
                  ),
                ),
                const Gap(20),
              ],
            );
          },
        ),
      ),
    );
  }
}

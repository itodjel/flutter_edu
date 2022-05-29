import 'package:appito/_all.dart';

class ExternalSignInWidget extends StatelessWidget {
  const ExternalSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (context.platform.isGoogleSignInAvailable) ...{
          ExternalSignInButton(
            signInProvider: SignInProvider.google,
            builder: (_, __, onTap, isLoading) {
              return Button(
                text: 'Google',
                primary: true,
                isLoading: isLoading,
                onTap: onTap,
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
                text: 'Facebook',
                primary: true,
                isLoading: isLoading,
                onTap: onTap,
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
                text: 'Apple',
                primary: true,
                isLoading: isLoading,
                onTap: onTap,
              );
            },
          ),
          const Gap(20),
        },
        Button(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          text: 'Verification code',
          primary: true,
          onTap: () => context.push(SendVerificationCodePage.route, SendVerificationCodePageModel()),
        ),
        const Gap(20),
        Button(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          text: 'Forgot your password?',
          textColor: context.theme.primaryColor,
          onTap: () => context.push(SendVerificationCodePage.route, SendVerificationCodePageModel()),
        ),
        const Gap(20),
      ],
    );
  }
}

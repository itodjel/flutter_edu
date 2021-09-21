import 'package:flutter_boilerplate/_all.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppAssets.applicationLogo,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

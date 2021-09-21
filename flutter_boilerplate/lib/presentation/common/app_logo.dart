import 'package:flutter_boilerplate/_all.dart';

enum _AppLogoType {
  normal,
  big,
  text,
}

class AppLogo extends StatelessWidget {
  final _AppLogoType _appLogoType;
  final EdgeInsetsGeometry padding;

  const AppLogo({
    this.padding = const EdgeInsets.all(0),
  }) : _appLogoType = _AppLogoType.normal;

  const AppLogo.big({
    this.padding = const EdgeInsets.all(15),
  }) : _appLogoType = _AppLogoType.big;

  const AppLogo.text({
    this.padding = const EdgeInsets.all(15),
  }) : _appLogoType = _AppLogoType.text;

  @override
  Widget build(BuildContext context) {
    if (_appLogoType == _AppLogoType.text) {
      return Text(
        context.localizer.translations.applicationName,
        style: const TextStyle(fontSize: 20),
      );
    }

    if (_appLogoType == _AppLogoType.big) {
      return Image.asset(AppAssets.applicationLogo, height: 80);
    }

    return Image.asset(AppAssets.applicationLogo, height: 35);
  }
}

import 'package:flutter_boilerplate/_all.dart';

class AllowLocationPage extends StatelessWidget {
  static const route = '/AllowLocationPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const AppLogo.big(),
              const Spacing.verticalL(2),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: context.theme.primaryColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 100,
                        color: Color.fromRGBO(233, 12, 0, 0.2),
                      ),
                      const Spacing.verticalL(),
                      Text(
                        context.localizer.translations.allowLocationDescription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacing.verticalL(3),
                      Button(
                        color: context.theme.primaryColor,
                        textColor: Colors.white,
                        text: context.localizer.translations.allowWhileUsingTheApp,
                        onTap: () {
                          context.read<LocationBloc>().add(LocationInitEvent());
                          context.navigator.pop(true);
                        },
                      ),
                      const Spacing.verticalL(1),
                      Button(
                        color: Colors.white,
                        textColor: context.theme.primaryColor,
                        text: context.localizer.translations.maybeLater,
                        borderColor: context.theme.primaryColor,
                        onTap: () => context.navigator.pop(false),
                      ),
                      //Spacing.verticalL(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

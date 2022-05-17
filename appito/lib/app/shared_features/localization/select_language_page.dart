import 'package:appito/_all.dart';

class SelectLanguagePage extends StatelessWidget {
  const SelectLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ListView(
        children: [
          const Gap(20),
          Text(
            'Enjoy the app by selecting your prefered language',
            style: context.theme.textTheme.headline2,
          ),
          const Gap(30),
          ...AppLanguages.values.map<Widget>((languageModel) => SelectLanguageWidget(languageModel: languageModel)).toList(),
        ],
      ),
    );
  }
}

class SelectLanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;

  const SelectLanguageWidget({
    Key? key,
    required this.languageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(15),
        child: Clickable(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            context.read<LocalizationBloc>().add(LocalizationChangeEvent(locale: languageModel.locale));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(languageModel.iconPath)),
                const Gap(30),
                Text(languageModel.name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

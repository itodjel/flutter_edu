import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter_boilerplate/_all.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LiquidSwipe(
          pages: [
            _OnBoardingWidget(
              index: 0,
              model: Introduction(
                imgUrl: AppAssets.onboarding1,
                title: context.localizer.translations.whoWeAre,
                description: context.localizer.translations.onBoardingFirstPageText,
              ),
            ),
            _OnBoardingWidget(
              index: 1,
              model: Introduction(
                imgUrl: AppAssets.onboarding2,
                title: context.localizer.translations.hostATailgate,
                description: context.localizer.translations.onBoardingSecondPageText,
              ),
            ),
            _OnBoardingWidget(
              index: 2,
              model: Introduction(
                imgUrl: AppAssets.onboarding3,
                title: context.localizer.translations.findATailgate,
                description: context.localizer.translations.onBoardingThirdPageText,
              ),
            ),
            NavigationWrapper(),
          ],
          waveType: WaveType.circularReveal,
          enableLoop: false,
          onPageChangeCallback: (index) {
            if (index == 3) {
              context.introductionBloc.add(IntroductionSetIntroSeenEvent());
            }
          },
        ),
      ),
    );
  }
}

class _OnBoardingWidget extends StatelessWidget {
  final int index;
  final Introduction model;

  _OnBoardingWidget({
    this.index = 0,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Splashable(
                    onTap: () => context.read<IntroductionBloc>().add(IntroductionSetIntroSeenEvent()),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        context.localizer.translations.skipOnboarding,
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 15,
                ),
                child: Image.asset(
                  AppAssets.applicationLogo,
                ),
              ),
              Container(
                height: context.mediaQuery.size.height * 0.5,
                width: context.mediaQuery.size.width,
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  model.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 20),
                child: Text(
                  model.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 20,
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (pIndex) => Dot(isActive: pIndex == index)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Introduction {
  String imgUrl;
  String title;
  String description;

  Introduction({
    required this.imgUrl,
    required this.title,
    required this.description,
  });
}

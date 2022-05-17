import 'package:appito/_all.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final pages = [
    for (var i = 0; i < 4; i++)
      PageViewModel(
        title: "Title of first page",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Click on "),
            Icon(Icons.edit),
            Text(" to edit a post"),
          ],
        ),
        image: const Center(child: Icon(Icons.android)),
      )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          context.read<IntroBloc>().add(IntroFinishEvent());
        },
        onSkip: () {
          context.read<IntroBloc>().add(IntroFinishEvent());
        },
        showSkipButton: true,
        back: const Text('Back'),
        skip: const Text('Skip'),
        next: const Text('Next'),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: context.theme.primaryColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}

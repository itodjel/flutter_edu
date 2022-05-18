import 'package:appito/_all.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(20),
            const Text('Home'),
            const ThemeChangeButton(),
            const Gap(20),
            OrientationLayoutBuilder(
              portrait: (_, __) => const HomePortrait(),
              landscape: (_, __) => const HomeLandscape(),
            ),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        var nextTheme = themeState.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
        return Button(
          onPressed: () => context.read<ThemeBloc>().add(ThemeChangeEvent(themeMode: nextTheme)),
          text: themeState.themeMode == ThemeMode.light ? 'Turn off lights' : 'Turn on lights',
          buttonColor: themeState.themeMode == ThemeMode.light ? AppColors.black : AppColors.orange,
        );
      },
    );
  }
}

class HomePortrait extends StatelessWidget {
  const HomePortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: context.screenHeight * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.red,
              ),
            );
          },
        ),
      ),
      medium: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: context.screenWidth * 0.5,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
      large: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.2),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: context.screenWidth * 0.5,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeLandscape extends StatelessWidget {
  const HomeLandscape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: context.screenWidth * 0.5,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
      medium: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: context.screenWidth * 0.25,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
      large: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.2),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: context.screenWidth * 0.15,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
      xLarge: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.15),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: context.screenWidth * 0.15,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:appito/_all.dart';

class OverlayContainer extends StatelessWidget {
  final Widget? overlayContent;
  final Widget? child;
  final bool active;

  const OverlayContainer({
    Key? key,
    this.overlayContent,
    this.child,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!active) {
      return child ?? Container();
    }

    return Stack(
      children: [
        child ?? Container(),
        overlayContent ??
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Loader(),
            ),
      ],
    );
  }
}

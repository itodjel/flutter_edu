import 'package:appito/_all.dart';

class PositionedLoader extends StatelessWidget {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final Widget? child;
  final bool isLoading;

  const PositionedLoader({
    Key? key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.child,
    this.isLoading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? Container(),
        if (isLoading)
          Positioned(
            left: left,
            top: top,
            right: right,
            bottom: bottom,
            child: const Loader.sm(),
          ),
      ],
    );
  }
}

import 'package:appito/_all.dart';

class Button extends StatelessWidget {
  final bool shrinkWrap;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final String? text;
  final Widget? child;
  final VoidCallback? onTap;

  const Button({
    Key? key,
    this.shrinkWrap = true,
    this.isLoading = false,
    this.padding,
    this.text,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onTap,
      child: Padding(
        padding: padding ?? context.appTheme.defaultButtonPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                () {
                  if (text.hasValue) {
                    return Text(
                      text.value,
                      style: TextStyle(color: isLoading ? Colors.transparent : null),
                    );
                  }

                  return child ?? Container();
                }(),
                if (isLoading) const Loader.sm(color: Colors.white),
              ],
            )
          ],
        ),
      ),
    );

    if (shrinkWrap) {
      return button;
    }

    return Row(
      children: [
        Expanded(
          child: button,
        ),
      ],
    );
  }
}

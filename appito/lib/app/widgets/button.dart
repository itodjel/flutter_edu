import 'package:appito/_all.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final bool shrinkWrap;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final String? text;
  final Widget? child;
  final Color? buttonColor;

  const Button({
    Key? key,
    required this.onPressed,
    this.shrinkWrap = true,
    this.isLoading = false,
    this.padding,
    this.text,
    this.child,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),
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
                      style: TextStyle(color: isLoading ? AppColors.transparent : null),
                    );
                  }

                  return child ?? Container();
                }(),
                if (isLoading) const Loader.sm(color: AppColors.white),
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

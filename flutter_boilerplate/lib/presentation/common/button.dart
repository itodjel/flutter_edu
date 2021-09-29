import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_boilerplate/_all.dart';

class Button extends StatefulWidget {
  final void Function()? onTap;
  final String? text;
  final Widget? child;
  final bool isLoading;
  final bool isDisabled;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double? borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final bool borderDotted;
  final double elevation;

  final bool primary;
  final bool accent;
  final bool transparent;
  final bool rounded;
  final bool shrinkWrap;

  const Button({
    this.onTap,
    this.text,
    this.child,
    this.isLoading = false,
    this.isDisabled = false,
    this.color,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    this.margin = const EdgeInsets.all(0),
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderDotted = false,
    this.elevation = 0,
    this.primary = false,
    this.accent = false,
    this.transparent = false,
    this.rounded = false,
    this.shrinkWrap = false,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color? get _color =>
      widget.color ??
      (widget.primary
          ? context.theme.primaryColor
          : widget.accent
              ? context.theme.colorScheme.secondary
              : widget.transparent
                  ? Colors.transparent
                  : null);

  double get _borderRadius => widget.borderRadius ?? (widget.rounded ? 50 : 5);

  @override
  Widget build(BuildContext context) {
    final button = Splashable(
      onTap: widget.isDisabled ? null : widget.onTap ?? () {},
      borderRadius: BorderRadius.circular(_borderRadius),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: widget.borderDotted ? widget.borderColor ?? _color ?? Colors.transparent : Colors.transparent,
        radius: Radius.circular(_borderRadius),
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _color,
            border: widget.borderDotted ? null : Border.all(color: widget.borderColor ?? _color ?? Colors.transparent, width: widget.borderWidth),
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          alignment: Alignment.center,
          child: () {
            if (widget.isLoading) {
              return Loader.sm(color: widget.textColor ?? Colors.white);
            }

            if (widget.text != null) {
              return Text(
                widget.text.value,
                style: TextStyle(color: widget.textColor ?? Colors.white),
              );
            }

            return widget.child;
          }(),
        ),
      ),
    );

    final elevatedButton = PhysicalModel(
      color: _color ?? Colors.transparent,
      elevation: widget.elevation,
      borderRadius: BorderRadius.circular(_borderRadius),
      child: button,
    );

    if (widget.elevation > 0) {
      if (widget.shrinkWrap) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: widget.margin,
              child: elevatedButton,
            ),
          ],
        );
      }

      return Container(
        margin: widget.margin,
        child: elevatedButton,
      );
    }

    if (widget.shrinkWrap) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: widget.margin,
            child: button,
          ),
        ],
      );
    }

    return Container(
      margin: widget.margin,
      child: button,
    );
  }
}

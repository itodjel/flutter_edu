import 'package:flutter/widgets.dart';

/// Namespace for Default Appito Breakpoints
abstract class AppitoBreakpoints {
  /// Max width for a small layout.
  static const double small = 760;

  /// Max width for a medium layout.
  static const double medium = 1644;

  /// Max width for a large layout.
  static const double large = 1920;
}

/// Signature for the individual builders (`small`, `large`, etc.).
typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder({
    Key? key,
    required this.small,
    this.large,
    this.medium,
    this.xLarge,
    this.child,
  }) : super(key: key);

  /// [ResponsiveLayoutWidgetBuilder] for small layout.
  final ResponsiveLayoutWidgetBuilder small;

  /// [ResponsiveLayoutWidgetBuilder] for medium layout.
  final ResponsiveLayoutWidgetBuilder? medium;

  /// [ResponsiveLayoutWidgetBuilder] for large layout.
  final ResponsiveLayoutWidgetBuilder? large;

  /// [ResponsiveLayoutWidgetBuilder] for xLarge layout.
  final ResponsiveLayoutWidgetBuilder? xLarge;

  /// Optional child widget which will be passed
  /// to the `small`, `large` and `xLarge`
  /// builders as a way to share/optimize shared layout.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= AppitoBreakpoints.small) {
          return small.call(context, child);
        }
        if (constraints.maxWidth <= AppitoBreakpoints.medium) {
          return (medium ?? large)?.call(context, child) ?? Container();
        }
        if (constraints.maxWidth <= AppitoBreakpoints.large) {
          return large?.call(context, child) ?? Container();
        }

        return (xLarge ?? large)?.call(context, child) ?? Container();
      },
    );
  }
}

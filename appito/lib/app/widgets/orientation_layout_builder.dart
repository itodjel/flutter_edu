import 'package:appito/_all.dart';

/// Signature for the individual builders (`portait` and `landscape`).
typedef OrientationLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

/// A wrapper around [Builder] which exposes builders for
/// orientation cases.
class OrientationLayoutBuilder extends StatelessWidget {
  const OrientationLayoutBuilder({
    Key? key,
    required this.portrait,
    this.landscape,
    this.child,
  }) : super(key: key);

  /// [OrientationLayoutWidgetBuilder] for portrait layout.
  final OrientationLayoutWidgetBuilder portrait;

  /// [OrientationLayoutWidgetBuilder] for landscape layout.
  final OrientationLayoutWidgetBuilder? landscape;

  /// Optional child widget which will be passed
  /// to the `portait` and `lanscape`
  /// builders as a way to share/optimize shared layout.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var orientation = MediaQuery.of(context).orientation;
        if (orientation == Orientation.portrait) {
          return portrait.call(context, child);
        }
        if (orientation == Orientation.landscape) {
          return (landscape ?? portrait).call(context, child);
        }
        return portrait.call(context, child);
      },
    );
  }
}

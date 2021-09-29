import 'package:expandable/expandable.dart';
import 'package:flutter_boilerplate/_all.dart';

enum ExpandableIconPlacement {
  left,
  right,
}

class Expandable extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Color? iconColor;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? bodyPadding;
  final ExpandableIconPlacement iconPlacement;

  Expandable({
    required this.header,
    required this.body,
    this.iconColor,
    this.color,
    this.padding,
    this.headerPadding,
    this.bodyPadding,
    this.iconPlacement = ExpandableIconPlacement.right,
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      color: color ?? _theme.primaryColor,
      padding: padding,
      child: ExpandablePanel(
        theme: ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          iconPlacement: iconPlacement == ExpandableIconPlacement.right ? ExpandablePanelIconPlacement.right : ExpandablePanelIconPlacement.left,
          tapBodyToCollapse: true,
          iconColor: iconColor ?? _theme.colorScheme.secondary,
          iconPadding: EdgeInsets.zero,
        ),
        header: Container(
          padding: headerPadding,
          child: header,
        ),
        expanded: Container(
          padding: bodyPadding,
          child: body,
        ),
        collapsed: Container(),
      ),
    );
  }
}

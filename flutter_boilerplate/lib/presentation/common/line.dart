import 'package:flutter_boilerplate/_all.dart';

enum LineOrientation {
  vertical,
  horizontal,
}

class Line extends StatelessWidget {
  final LineOrientation? orientation;
  final double? thickness;
  final double? length;
  final Color? color;

  Line.vertical({this.thickness, this.length, this.color}) : orientation = LineOrientation.vertical;
  Line.horizontal({this.thickness, this.length, this.color}) : orientation = LineOrientation.horizontal;

  @override
  Widget build(BuildContext context) {
    switch (orientation) {
      case LineOrientation.vertical:
        return Container(color: color ?? Colors.black12, width: thickness ?? 1);
      case LineOrientation.horizontal:
        return Container(color: color ?? Colors.black12, height: thickness ?? 1);
      default:
        return Container(color: color ?? Colors.black12, height: thickness ?? 1);
    }
  }
}

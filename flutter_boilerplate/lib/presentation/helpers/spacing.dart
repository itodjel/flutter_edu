import 'package:flutter_boilerplate/_all.dart';

class Spacing extends StatelessWidget {
  final double _width;
  final double _height;
  final double times;

  const Spacing.horizontalXS([this.times = 1])
      : _width = 0,
        _height = 3;
  const Spacing.horizontalS([this.times = 1])
      : _width = 5,
        _height = 0;
  const Spacing.horizontalM([this.times = 1])
      : _width = 10,
        _height = 0;
  const Spacing.horizontalL([this.times = 1])
      : _width = 20,
        _height = 0;
  const Spacing.verticalXS([this.times = 1])
      : _width = 3,
        _height = 0;
  const Spacing.verticalS([this.times = 1])
      : _width = 0,
        _height = 5;
  const Spacing.verticalM([this.times = 1])
      : _width = 0,
        _height = 10;
  const Spacing.verticalL([this.times = 1])
      : _width = 0,
        _height = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width * times,
      height: _height * times,
    );
  }
}

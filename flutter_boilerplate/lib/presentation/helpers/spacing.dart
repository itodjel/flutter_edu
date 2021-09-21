import 'package:flutter_boilerplate/_all.dart';

class Spacing extends StatelessWidget {
  final double _width;
  final double _height;
  final double times;

  const Spacing.h_xxxs([this.times = 1])
      : _width = 1,
        _height = 0;
  const Spacing.h_xxs([this.times = 1])
      : _width = 2,
        _height = 0;
  const Spacing.h_xs([this.times = 1])
      : _width = 3,
        _height = 0;
  const Spacing.h_s([this.times = 1])
      : _width = 5,
        _height = 0;
  const Spacing.h_m([this.times = 1])
      : _width = 10,
        _height = 0;
  const Spacing.h_l([this.times = 1])
      : _width = 20,
        _height = 0;
  const Spacing.h_xl([this.times = 1])
      : _width = 30,
        _height = 0;
  const Spacing.h_xxl([this.times = 1])
      : _width = 40,
        _height = 0;
  const Spacing.h_xxxl([this.times = 1])
      : _width = 50,
        _height = 0;

  const Spacing.v_xxxs([this.times = 1])
      : _width = 0,
        _height = 1;
  const Spacing.v_xxs([this.times = 1])
      : _width = 0,
        _height = 2;
  const Spacing.v_xs([this.times = 1])
      : _width = 0,
        _height = 3;
  const Spacing.v_s([this.times = 1])
      : _width = 0,
        _height = 5;
  const Spacing.v_m([this.times = 1])
      : _width = 10,
        _height = 10;
  const Spacing.v_l([this.times = 1])
      : _width = 20,
        _height = 20;
  const Spacing.v_xl([this.times = 1])
      : _width = 30,
        _height = 30;
  const Spacing.v_xxl([this.times = 1])
      : _width = 40,
        _height = 40;
  const Spacing.v_xxxl([this.times = 1])
      : _width = 50,
        _height = 50;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width * times,
      height: _height * times,
    );
  }
}

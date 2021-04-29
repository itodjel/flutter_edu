import 'package:flutter_boilerplate/all.dart';

class Spacing extends StatelessWidget {
  final double _width;
  final double _height;
  final double times;

  Spacing.h_xxxs([this.times = 1])
      : _width = 1,
        _height = 0;
  Spacing.h_xxs([this.times = 1])
      : _width = 2,
        _height = 0;
  Spacing.h_xs([this.times = 1])
      : _width = 3,
        _height = 0;
  Spacing.h_s([this.times = 1])
      : _width = 5,
        _height = 0;
  Spacing.h_m([this.times = 1])
      : _width = 10,
        _height = 0;
  Spacing.h_l([this.times = 1])
      : _width = 20,
        _height = 0;
  Spacing.h_xl([this.times = 1])
      : _width = 30,
        _height = 0;
  Spacing.h_xxl([this.times = 1])
      : _width = 40,
        _height = 0;
  Spacing.h_xxxl([this.times = 1])
      : _width = 50,
        _height = 0;

  Spacing.v_xxxs([this.times = 1])
      : _width = 0,
        _height = 1;
  Spacing.v_xxs([this.times = 1])
      : _width = 0,
        _height = 2;
  Spacing.v_xs([this.times = 1])
      : _width = 0,
        _height = 3;
  Spacing.v_s([this.times = 1])
      : _width = 0,
        _height = 5;
  Spacing.v_m([this.times = 1])
      : _width = 10,
        _height = 10;
  Spacing.v_l([this.times = 1])
      : _width = 20,
        _height = 20;
  Spacing.v_xl([this.times = 1])
      : _width = 30,
        _height = 30;
  Spacing.v_xxl([this.times = 1])
      : _width = 40,
        _height = 40;
  Spacing.v_xxxl([this.times = 1])
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

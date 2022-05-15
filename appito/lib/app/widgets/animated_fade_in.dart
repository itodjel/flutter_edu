import 'package:flutter/material.dart';

const _defaultFadeInDuration = Duration(seconds: 1);

/// Widget that applies a fade in transition to its child.
class AnimatedFadeIn extends StatefulWidget {
  const AnimatedFadeIn({
    Key? key,
    required this.child,
    this.duration = _defaultFadeInDuration,
  }) : super(key: key);

  /// The child which will be faded in.
  final Widget child;

  /// The duration of the fade in animation.
  final Duration duration;

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedFadeInState createState() => _AnimatedFadeInState();
}

class _AnimatedFadeInState extends State<AnimatedFadeIn> {
  var _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _isVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.duration,
      opacity: _isVisible ? 1.0 : 0.0,
      child: widget.child,
    );
  }
}

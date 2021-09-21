import 'package:flutter_boilerplate/_all.dart';

class CircleInitialsAvatar extends StatefulWidget {
  final String text;
  final double radius;
  final double borderRadius;

  CircleInitialsAvatar({
    required this.text,
    this.radius = 15,
    this.borderRadius = 50,
  });

  @override
  _CircleInitialsAvatarState createState() => _CircleInitialsAvatarState();
}

class _CircleInitialsAvatarState extends State<CircleInitialsAvatar> {
  Color toColor(String text) => circleInitialsAvatarHexColors[text.value.length % circleInitialsAvatarHexColors.count()].first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.radius * 2,
      height: widget.radius * 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: toColor(widget.text),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        widget.text.initials().value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: widget.radius * 0.6,
        ),
      ),
    );
  }
}

final circleInitialsAvatarHexColors = [
  {const Color(0xFF139C8B), Colors.white},
  {const Color(0xFF1E5AB3), Colors.white},
  {const Color(0xFF131670), Colors.white},
  {const Color(0xFF72A55C), Colors.white},
  {const Color(0xFF6821C4), Colors.white},
  {const Color(0xFFC421C4), Colors.white},
  {const Color(0xFFCC2900), Colors.white},
  {const Color(0xFF079CFF), Colors.white},
  {const Color(0xFFF27900), Colors.white},
  {const Color(0xFFFFC107), Colors.white},
  {const Color(0xFF007ED2), Colors.white},
  {const Color(0xFF118C7D), Colors.white},
  {const Color(0xFF669552), Colors.white},
  {const Color(0xFF507440), Colors.white},
  {const Color(0xFF531A9D), Colors.white},
  {const Color(0xFFB01EB0), Colors.white},
  {const Color(0xFF891789), Colors.white},
  {const Color(0xFF621062), Colors.white},
  {const Color(0xFFECB100), Colors.white},
  {const Color(0xFFB78A00), Colors.white},
];

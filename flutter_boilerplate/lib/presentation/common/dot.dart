import 'package:flutter_boilerplate/_all.dart';

class Dot extends StatelessWidget {
  final bool isActive;

  final Color? color;
  final Color? borderColor;

  Dot({
    required this.isActive,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive ? color ?? context.theme.primaryColor : Colors.transparent,
        border: isActive
            ? null
            : Border.all(
                width: 1,
                color: color ?? context.theme.primaryColor,
              ),
      ),
    );
  }
}

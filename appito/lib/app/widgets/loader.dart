import 'package:appito/_all.dart';

class Loader extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const Loader({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  const Loader.sm({
    Key? key,
    this.width = 16,
    this.height = 16,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? context.theme.primaryColor),
        ),
      ),
    );
  }
}

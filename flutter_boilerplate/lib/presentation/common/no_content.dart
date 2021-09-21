import 'package:flutter_boilerplate/_all.dart';

enum _NoContentType {
  imageAndText,
  text,
}

class NoContent extends StatelessWidget {
  final _NoContentType _type;
  final String? message;

  NoContent([this.message]) : _type = _NoContentType.imageAndText;
  NoContent.text([this.message]) : _type = _NoContentType.text;

  @override
  Widget build(BuildContext context) {
    if (_type == _NoContentType.imageAndText) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.placeholderNoContent, height: 60),
              const Spacing.horizontalXS(2),
              Text(message ?? 'No content'),
            ],
          ),
        ),
      );
    }

    if (_type == _NoContentType.imageAndText) {
      return Container(
        child: Center(
          child: Text(message ?? 'No content'),
        ),
      );
    }

    return Container();
  }
}

import 'package:flutter_boilerplate/_all.dart';

enum _ErrorContainerType {
  imageAndText,
  text,
}

class ErrorContainer extends StatelessWidget {
  final _ErrorContainerType _type;
  final String? message;

  ErrorContainer([this.message]) : _type = _ErrorContainerType.imageAndText;
  ErrorContainer.text([this.message]) : _type = _ErrorContainerType.text;

  @override
  Widget build(BuildContext context) {
    if (_type == _ErrorContainerType.imageAndText) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.placeholderNoContent, height: 60),
              const Spacing.horizontalXS(2),
              Text(message ?? 'Error happened'),
            ],
          ),
        ),
      );
    }

    if (_type == _ErrorContainerType.imageAndText) {
      return Container(
        child: Center(
          child: Text(message ?? 'Error happened'),
        ),
      );
    }

    return Container();
  }
}

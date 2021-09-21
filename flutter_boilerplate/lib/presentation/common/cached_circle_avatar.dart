import 'dart:io';

import 'package:flutter_boilerplate/_all.dart';

class CachedCircleAvatar extends StatelessWidget {
  final String? url;
  final File? file;
  final String? text;
  final double radius;
  final double borderRadius;

  CachedCircleAvatar({
    this.url,
    this.file,
    this.text,
    this.radius = 15,
    this.borderRadius = 50,
  });

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(file!),
      );
    }

    if (url.hasValue) {
      return Container(
        width: radius * 2,
        height: radius * 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: CachedImage(url: url),
        ),
      );
    }

    if (text.hasValue) {
      return CircleInitialsAvatar(
        text: text!,
        radius: radius,
        borderRadius: borderRadius,
      );
    }

    return Container(
      width: radius * 2,
      height: radius * 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: const CachedImage(),
      ),
    );
  }
}

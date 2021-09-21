import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_boilerplate/_all.dart';

Future<File?> cropImage({required BuildContext context, required String path}) async {
  try {
    return await ImageCropper.cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop your photo',
        toolbarColor: Colors.white,
        toolbarWidgetColor: context.theme.primaryColor,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
        activeControlsWidgetColor: context.theme.primaryColor,
      ),
      iosUiSettings: const IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    );
  } catch (e) {
    print(e);
  }

  return null;
}

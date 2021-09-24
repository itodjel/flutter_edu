import 'dart:io';
import 'package:flutter_boilerplate/_all.dart';

enum LocalImagePickerType { choose, camera, gallery }

class LocalImagePicker extends StatelessWidget {
  final LocalImagePickerType _type;
  final Widget child;
  final bool disabled;
  final bool useCropper;
  final int imageQualityPercentage;
  final void Function(File image)? onImageTaken;
  final void Function(File image)? onImageCropped;

  LocalImagePicker({
    required this.child,
    this.disabled = false,
    this.useCropper = false,
    this.imageQualityPercentage = 100,
    this.onImageTaken,
    this.onImageCropped,
  }) : _type = LocalImagePickerType.choose;

  LocalImagePicker.camera({
    required this.child,
    this.disabled = false,
    this.useCropper = false,
    this.imageQualityPercentage = 100,
    this.onImageTaken,
    this.onImageCropped,
  }) : _type = LocalImagePickerType.camera;

  LocalImagePicker.gallery({
    required this.child,
    this.disabled = false,
    this.useCropper = false,
    this.imageQualityPercentage = 100,
    this.onImageTaken,
    this.onImageCropped,
  }) : _type = LocalImagePickerType.gallery;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled
          ? null
          : () async {
              if (_type == LocalImagePickerType.choose) {
                await chooseLocalImagePickerType(context);
              }

              try {
                final pickedFile = await ImagePicker().pickImage(
                  source: _type == LocalImagePickerType.camera ? ImageSource.camera : ImageSource.gallery,
                  imageQuality: imageQualityPercentage,
                );

                if (pickedFile?.path != null) {
                  if (onImageTaken != null) {
                    onImageTaken!(File(pickedFile!.path));
                  }

                  if (useCropper) {
                    final croppedFile = await cropImage(context: context, path: pickedFile!.path);

                    if (onImageCropped != null && croppedFile != null) {
                      onImageCropped!(croppedFile);
                    }
                  }
                }
              } catch (e) {
                print('EXCEPTION IN LOCAL_IMAGE_PICKER: $e');
              }
            },
      child: child,
    );
  }

  Future<LocalImagePickerType> chooseLocalImagePickerType(BuildContext context) async {
    return (await showDialog<LocalImagePickerType>(
          context: context,
          builder: (BuildContext context) {
            final localizer = context.localizer;

            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      context.navigator.pop(LocalImagePickerType.camera);
                    },
                    title: Text(localizer.translations.camera),
                    trailing: const Icon(AppIcons.camera),
                  ),
                  ListTile(
                    onTap: () {
                      context.navigator.pop(LocalImagePickerType.gallery);
                    },
                    title: Text(localizer.translations.gallery),
                    trailing: const Icon(AppIcons.imageGallery),
                  ),
                ],
              ),
            );
          },
        )) ??
        LocalImagePickerType.camera;
  }
}

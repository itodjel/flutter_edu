import 'package:flutter_boilerplate/_all.dart';

class InfoDialog extends StatelessWidget {
  final Widget? child;
  final String? message;
  final Function? onClose;
  final String? buttonText;

  InfoDialog({
    this.child,
    this.message,
    this.onClose,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
              color: context.theme.primaryColorLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child ??
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Text(
                        message.value,
                        softWrap: true,
                        style: const TextStyle(fontFamily: AppFonts.mavenProRegular),
                      ),
                    ),
              ],
            ),
          ),
          Positioned(
            bottom: -25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Button(
                  margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  onTap: () {
                    if (onClose != null) {
                      onClose!();
                    }
                    context.navigator.pop();
                  },
                  color: const Color(0xFF1D1D1D),
                  child: Text(buttonText ?? 'Ok'.toUpperCase(), style: const TextStyle(color: Colors.white, fontFamily: AppFonts.mavenProRegular)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter_boilerplate/_all.dart';

class PasswordTextFormField extends StatefulWidget {
  final InputDecoration? decoration;
  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;
  final String? hintText;

  const PasswordTextFormField({
    Key? key,
    this.decoration,
    this.validator,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText ?? context.localizer.translations.password,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: obscureText ? Colors.black12 : context.theme.primaryColor,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
      obscureText: obscureText,
    );
  }
}

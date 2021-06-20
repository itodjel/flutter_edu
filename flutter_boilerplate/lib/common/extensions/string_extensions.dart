extension StringExtensions on String {
  bool get hasValue => !(isEmpty || trim().isEmpty);
  String cut(int maxLength) => length < maxLength ? this : '${substring(0, maxLength)}...';
  String initials({String delimiter = ' '}) => hasValue ? split(delimiter).map<String>((x) => x.isNotEmpty ? x[0] : '').join() : '';
  bool get isEmail => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  bool get hasUppercase => contains(RegExp(r'[A-Z]'));
  bool get hasDigits => contains(RegExp(r'[0-9]'));
  bool get isPhoneNumber => contains(RegExp(r'^(?:[+])?[0-9\s]+$'));
  bool get hasLowercase => contains(RegExp(r'[a-z]'));
  bool get hasSpecialCharacters => contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}

extension StringExtensions on String {
  bool get hasValue => !(this == null || isEmpty || trim().isEmpty);
  String get safeValue => this ?? '';
  String cut(maxLength) => this == null
      ? ''
      : maxLength == null
          ? this
          : length < maxLength
              ? this
              : '${substring(0, maxLength)}...';
  bool get isEmail => (this != null) && RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  bool get hasUppercase => (this != null) && contains(RegExp(r'[A-Z]'));
  bool get hasDigits => (this != null) && contains(RegExp(r'[0-9]'));
  bool get isPhoneNumber => (this != null) && contains(RegExp(r'^(?:[+])?[0-9\s]+$'));
  bool get hasLowercase => (this != null) && contains(RegExp(r'[a-z]'));
  bool get hasSpecialCharacters => (this != null) && contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool get isNumeric => (this != null) && double.parse(this, (e) => null) != null;
  String get phoneNumberRegion => this == null ? null : RegExp(r'\+[0-9]+\s').stringMatch(this);
  String initials({String delimiter = ' '}) => hasValue ? this.split(' ').map<String>((x) => x.length > 0 ? x[0] : '').join() : null;
}

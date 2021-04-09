import 'package:flutter_boilerplate/all.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  DateTime copyWith(TimeOfDay? timeOfDay) => DateTime(year, month, day, timeOfDay?.hour ?? 0, timeOfDay?.minute ?? 0);
  bool isEqualDate(DateTime other) => year == other.year && month == other.month && day == other.day;
  String toISO() => '$year$month$day$hour$minute$second';
}

extension DateTimeNullableExtensions on DateTime? {
  String format(Localizer localizer) => this == null ? '' : DateFormat.yMMMMd(localizer.currentLanguage.locale.languageCode).format(this!).toString();
}

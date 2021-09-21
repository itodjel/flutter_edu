import 'package:flutter_boilerplate/_all.dart';
import 'package:flutter_boilerplate/common/localization/localizer.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  DateTime copyWith(TimeOfDay timeOfDay) => DateTime(year, month, day, timeOfDay.hour, timeOfDay.minute);
  bool isEqualDate(DateTime other) => year == other.year && month == other.month && day == other.day;
  String toISO() => '$year$month$day$hour$minute$second';
  String format(Localizer localizer) => DateFormat.yMMMMd(localizer.currentLanguage.locale.languageCode).format(this).toString();

  String formatyMMMMEEEEd(Localizer localizer) => DateFormat.yMMMMEEEEd(localizer.currentLanguage.locale.languageCode).format(this).toString();
  String formattime(Localizer localizer) => DateFormat.Hm(localizer.currentLanguage.locale.languageCode).format(this).toString();
  String formattimehmma(Localizer localizer) => DateFormat('h:mm a', localizer.currentLanguage.locale.languageCode).format(this).toString();
  String formatd(Localizer localizer) => DateFormat.EEEE(localizer.currentLanguage.locale.languageCode).format(this).toString();
  String formatMMMd(Localizer localizer) => DateFormat.MMMd(localizer.currentLanguage.locale.languageCode).format(this).toString();
  String formatMMMdEEE(Localizer localizer) => DateFormat('MMM, d EEE').format(this).toString();
}

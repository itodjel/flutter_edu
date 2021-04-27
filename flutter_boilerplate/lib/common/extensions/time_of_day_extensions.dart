import 'package:flutter_boilerplate/all.dart';

TimeOfDay? parseTimeOfDay(String? value) => value != null ? TimeOfDay(hour: int.parse(value.split(':')[0]), minute: int.parse(value.split(':')[1])) : null;

extension TimeOfDayExtension on TimeOfDay {
  bool isBetween(TimeOfDay left, TimeOfDay right) {
    return ((left.hour < hour || (left.hour == hour && left.minute <= minute)) && (right.hour > hour || (right.hour == hour && right.minute >= minute)));
  }

  bool isAfter(TimeOfDay right) {
    return (right.hour < hour || (right.hour == hour && right.minute < minute));
  }

  double toDouble() => this.hour + this.minute / 60.0;

  double toDoubleMinutes() => this.hour * 60.0 + this.minute;

  TimeOfDay difference(TimeOfDay right) {
    final differenceInMinutes = (this.toDoubleMinutes() - right.toDoubleMinutes()).abs();

    return TimeOfDay(
      hour: (differenceInMinutes / 60.0).floor(),
      minute: (differenceInMinutes % 60).floor(),
    );
  }

  String toFormattedString() => '${this.hour < 10 ? 0 : ''}${this.hour}:${this.minute < 10 ? 0 : ''}${this.minute}';
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String FORMAT_LONG_DAY_MONTH_TIME = "EEEE, dd MMMM yyyy HH:mm:ss";
const String FORMAT_LONG_DAY_AND_MONTH = "EEEE, dd MMMM yyyy";
const String FORMAT_DD_MMM_YYYY = "dd MMM yyyy";
const String FORMAT_EEE_DD_MMM_YYYY = "EEE, dd MMM yyyy";
const String FORMAT_DEFAULT = "yyyy-MM-dd HH:mm:ss";

String formatTime(TimeOfDay timeOfDay) {
  var h = timeOfDay.hour;
  var m = timeOfDay.minute;
  var hour = h < 10 ? "0$h" : h.toString();
  var minutes = m < 10 ? "0$m" : m.toString();
  return "$hour:$minutes";
}

String formatToString(DateTime date, String format) =>
    DateFormat(format).format(date);

DateTime parseToDate(String dateString, String format) =>
    DateFormat(format).parse(dateString);

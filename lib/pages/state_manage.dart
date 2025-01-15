import 'package:flutter/material.dart';

class TimeZoneState with ChangeNotifier {
  String _timeZone1 = '-';
  String _timeZone2 = '-';

  String get timeZone1 => _timeZone1;
  String get timeZone2 => _timeZone2;

  void setTimeZone1(String value) {
    _timeZone1 = value;
    notifyListeners();
  }

  void setTimeZone2(String value) {
    _timeZone2 = value;
    notifyListeners();
  }
}

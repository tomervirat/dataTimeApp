import 'dart:convert';

import 'package:http/http.dart' as http;

List<String> timezones = [];
bool isFetched = false;

class AvailableTimeZones {

  Future<List<String>> getAllAvailableTimeZones() async {
    if (!isFetched) {
      try {
        final uri = Uri.https('timeapi.io', '/api/TimeZone/AvailableTimeZones');

        // First try without explicitly requesting gzip
        final response = await http.get(uri);
        timezones = List<String>.from(jsonDecode(response.body));
        isFetched = true;
      } catch (e) {
        isFetched = false;
      }
    }
    return timezones;
  }
}

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  List<String>? location;
  String? timeZone;
  String? time;
  String? date;
  String? flag;
  String? phase;

  WorldTime({this.timeZone, this.flag});

  Future<void> getTime() async {
    try {
      Uri uri = Uri.https(
          'timeapi.io', '/api/time/current/zone', {'timeZone': '$timeZone'});

      Response response = await get(uri);

      Map data = jsonDecode(response.body);

      String dateTime = data['dateTime'];

      DateTime now = DateTime.parse(dateTime);
      time = DateFormat().add_jm().format(now);
      date = formatDate(now);

      if (now.hour > 5 && now.hour < 12 )
        phase = 'morning';
      else if (now.hour > 11 && now.hour < 17)
        phase = 'noon';
      else if (now.hour > 16 && now.hour < 20)
        phase = 'evening';
      else if(now.hour > 19 && now.hour < 24)
        phase = 'night';
      else if(now.hour >= 0 && now.hour < 4)
        phase = 'midnight';
      else if(now.hour > 3 && now.hour < 6)
        phase = 'dawn';

      location = timeZone!.split('/');


    } catch (e) {
      print('caught error : $e');
      time = 'could not get the time';
    }
  }

  String formatDate(DateTime date) {
    String day = DateFormat('d').format(date); // Day without suffix
    String suffix = getDaySuffix(int.parse(day)); // Get suffix for the day
    return DateFormat('MMMM d').format(date) + suffix + DateFormat(', yyyy').format(date);
  }

// Helper function to get the suffix for the day
  String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th'; // Special case for 11th, 12th, 13th
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}

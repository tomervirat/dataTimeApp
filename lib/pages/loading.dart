import 'package:flutter/material.dart';
import 'package:date_time/services/world_time.dart';
import 'package:date_time/services/available_time_zones.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String timeZone;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    timeZone = args?['timeZone'] ?? 'Asia/Kolkata'; // Default timezone
    print('new timeZone = $timeZone');
    setUpWorldTime();
  }

  void setUpWorldTime() async {
    WorldTime instance =
        WorldTime(timeZone: timeZone, flag: 'london.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'date': instance.date,
      'timeZone': instance.timeZone,
      'flag': instance.flag,
      'phase': instance.phase
    });

    AvailableTimeZones timeZones = AvailableTimeZones();
    List<String> timezones = await timeZones.getAllAvailableTimeZones();
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.orangeAccent,
            size: 80.0,
          ),
      )
    );
  }
}

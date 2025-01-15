import 'package:flutter/material.dart';

class Conversion extends StatefulWidget {
  const Conversion({super.key});

  @override
  State<Conversion> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  late String timeZone;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fetch the timeZone argument from the route
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if(args?['timeZone'] == null) {
      print('timezone is null');
    }
    timeZone = args?['timeZone'] ?? 'Asia/Kolkata'; // Default timezone if null
    print('new timeZone = $timeZone');
    setState(() {}); // Trigger a rebuild after setting the timeZone
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Time Conversion',
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navigate to location page (or any other page)
            Navigator.pushNamed(context, '/location');
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              timeZone, // Display the selected time zone
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

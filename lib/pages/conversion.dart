import 'package:flutter/material.dart';

class Conversion extends StatefulWidget {
  const Conversion({super.key});

  @override
  State<Conversion> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  String timeZone1 = '-';
  String timeZone2 = '-';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('initial $timeZone1 - $timeZone2');

    // Fetch the timeZone argument from the route
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    if (args != null) {
      // Update timeZone1 if button1 is clicked and timeZone1 is still the default '-'
      if (args['fromButton'] == 'button1' && timeZone1 == '-') {
        timeZone1 = args['timeZone'] ?? '-'; // Default timezone if null
      }

      // Update timeZone2 if button2 is clicked and timeZone2 is still the default '-'
      if (args['fromButton'] == 'button2' && timeZone2 == '-') {
        timeZone2 = args['timeZone'] ?? '-'; // Default timezone if null
      }
    }

    print('final $timeZone1 - $timeZone2');

    // Trigger a rebuild after setting the timeZone
    setState(() {});
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
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to location page (or any other page)
                Navigator.pushNamed(context, '/location', arguments: {'previousRoute': '/conversion', 'fromButton' : 'button1'});
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  timeZone1, // Display the selected time zone
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to location page (or any other page)
                Navigator.pushNamed(context, '/location', arguments: {'previousRoute': '/conversion', 'fromButton' : 'button2'});
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  timeZone2, // Display the selected time zone
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

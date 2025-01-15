import 'package:date_time/pages/error.dart';
import 'package:flutter/material.dart';
import 'package:date_time/pages/location_display.dart';
import 'bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data =
        ModalRoute
            .of(context)
            ?.settings
            .arguments as Map<dynamic, dynamic> ??
            {};

    String bgImage = '';
    try {
      bgImage = data['phase'] + '.png';
    } catch (e) {
      bgImage = '';
    }
    List<String> location = data['location'];

    return bgImage.isNotEmpty
        ? Scaffold(
      appBar: AppBar(
        title: const Text(
          'World Time',
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['time'],
                    style: const TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                data['date'],
                style: const TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              LocationDisplay(location: location),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: const Icon(
                  Icons.edit_location,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    )
        : Scaffold(body: ErrorNotFound()); // Simply use your Error widget here
  }
  }

import 'package:date_time/pages/state_manage.dart';
import 'package:date_time/services/available_time_zones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<String> timeZones = ['Asia/Kolkata'];
  List<String> filteredTimeZones = [];
  TextEditingController _searchController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAllTimeZones();
    _searchController.addListener(filterTimezone);
  }

  void fetchAllTimeZones() async {
    AvailableTimeZones allTimeZones = AvailableTimeZones();
    List<String> fetchedTimeZones =
        await allTimeZones.getAllAvailableTimeZones();

    if (isLoading) {
      setState(() {
        timeZones = fetchedTimeZones;
        isLoading = false;
      });
    }
    filteredTimeZones = timeZones;
  }

  void filterTimezone() {
    String query = _searchController.text.toLowerCase();
    filteredTimeZones = timeZones;
    setState(() {
      filteredTimeZones = timeZones
          .where((timezone) => timezone.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeZoneState = Provider.of<TimeZoneState>(context);

    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text(
          'Choose location',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: isLoading
          ? const SpinKitRotatingCircle(
              color: Colors.orangeAccent,
              size: 80.0,
            )
          : Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        labelText: 'Search for a timezone',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredTimeZones.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            String selectedTimeZone = filteredTimeZones[index];
                            Navigator.pop(context);
                            String fromButton = args?['fromButton'];
                            if (args?['previousRoute'] == '/home') {
                              Navigator.pushReplacementNamed(context, '/',
                                  arguments: {'timeZone': selectedTimeZone});
                            } else if (args?['previousRoute'] ==
                                '/conversion') {
                              if (fromButton == "button1") {
                                timeZoneState.setTimeZone1(selectedTimeZone);
                              } else {
                                timeZoneState.setTimeZone2(selectedTimeZone);
                              }
                              Navigator.popAndPushNamed(context, '/conversion',
                                  arguments: {
                                    'timeZone': selectedTimeZone,
                                    'fromButton': fromButton
                                  });
                            }
                          },
                          title: Text(filteredTimeZones[index]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

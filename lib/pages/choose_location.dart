import 'package:date_time/services/available_time_zones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    print('isLoading : $isLoading');
    if (isLoading) {
      setState(() {
        timeZones = fetchedTimeZones;
        isLoading = false;
      });
    }
    filteredTimeZones = timeZones;
    print('size ------ ${timeZones.length}');
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
    print('build state function ran inside widget');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Choose location',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: isLoading
          ? SpinKitRotatingCircle(
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
                      decoration: InputDecoration(
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
                            Navigator.pushReplacementNamed(context, '/',
                                arguments: {'timeZone': selectedTimeZone});
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

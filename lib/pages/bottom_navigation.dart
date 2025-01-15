import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            if (ModalRoute.of(context)?.settings.name != '/home') {
              Navigator.pushNamed(context, '/home');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // Set background color
            elevation: 0, // Remove elevation to make it flat
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black,),
              borderRadius:
                  BorderRadius.zero, // Make corners square (no roundness)
            ),
          ),
          child: const Text(
            "Home",
            style: TextStyle(
              fontSize: 16, // You can adjust the font size as needed
              color: Colors.black, // Text color
            ),
          ), // Pass function reference
        ),
      ),
      Expanded(
        child: ElevatedButton(
          onPressed: (){
            if (ModalRoute.of(context)?.settings.name != '/conversion') {
              Navigator.pushNamed(context, '/conversion');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // Set background color
            elevation: 0, // Remove elevation to make it flat
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black,),
              borderRadius:
                  BorderRadius.zero, // Make corners square (no roundness)
            ),
          ),
          child: const Text(
            "Conversion",
            style: TextStyle(
              fontSize: 16, // You can adjust the font size as needed
              color: Colors.black, // Text color
            ),
          ), // Pass function reference
        ),
      ),
      Expanded(
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // Set background color
            elevation: 100, // Remove elevation to make it flat
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black,),
              borderRadius:
                  BorderRadius.zero, // Make corners square (no roundness)
            ),
          ),
          child: const Text(
            "Calculation",
            style: TextStyle(
              fontSize: 16, // You can adjust the font size as needed
              color: Colors.black, // Text color
            ),
          ), // Pass function reference
        ),
      ),
    ]);
  }
}

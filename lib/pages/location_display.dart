import 'package:flutter/material.dart';

class LocationDisplay extends StatelessWidget {
  final List<String> location;

  const LocationDisplay({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildLocationWidgets(),
    );
  }

  List<Widget> _buildLocationWidgets() {
    if (location.isEmpty) {
      return [
        const Text(
          "No location available",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ];
    }

    // Reverse the order of the list
    List<String> reversedLocation = location.reversed.toList();

    return List.generate(reversedLocation.length, (index) {
      double fontSize;

      // Dynamically assign font sizes based on position
      switch (index) {
        case 0: // Last item (smallest size)
          fontSize = 28.0;
          break;
        case 1: // Middle item
          fontSize = 24.0;
          break;
        default: // First item (largest size)
          fontSize = 20.0;
      }

      return Text(
        reversedLocation[index],
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      );
    });
  }
}
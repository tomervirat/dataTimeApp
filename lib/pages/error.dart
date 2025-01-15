import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // To center vertically
          children: [
            // Use Lottie.network with a valid Lottie animation URL
            Lottie.asset('assets/lottie/error.json', // Ensure this is a valid Lottie JSON URL
              width: 300,  // You can adjust the size if needed
              height: 300,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Error!!! Data not found...',
                style: TextStyle(
                  color: Colors.pink[600],
                  fontSize: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

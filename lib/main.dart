import 'package:date_time/pages/state_manage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'package:date_time/pages/loading.dart';
import 'package:date_time/pages/choose_location.dart';
import 'package:date_time/pages/error.dart';
import 'package:date_time/pages/conversion.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => TimeZoneState()), // Add the global state
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
        '/error': (context) => ErrorNotFound(),
        '/conversion': (context) => const Conversion(),
      },
    );
  }
}

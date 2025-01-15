import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:date_time/pages/loading.dart';
import 'package:date_time/pages/choose_location.dart';
import 'package:date_time/pages/error.dart';
import 'package:date_time/pages/conversion.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => const Loading(),
    '/home' : (context) => const Home(),
    '/location' : (context) => const ChooseLocation(),
    '/error' : (context) => ErrorNotFound(),
    '/conversion': (context) => Conversion(),
  },
));

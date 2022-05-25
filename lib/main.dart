import 'package:flutter/material.dart';
import 'package:weather_app_flutter/app/modules/home/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const HomeScreen(),
    );
  }
}

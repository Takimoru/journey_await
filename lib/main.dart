import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/destination_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journey Awaits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/destinationDetail': (context) => DestinationDetail(),
      },
    );
  }
}

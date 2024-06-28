import 'package:flutter/material.dart';
import 'package:aplikasiwisata/pages/home_page.dart';
import 'package:aplikasiwisata/pages/destination_detail.dart';
import 'package:aplikasiwisata/pages/destination_detail2.dart';
import 'package:aplikasiwisata/pages/destination_detail3.dart'; // Import the third detail page
import 'package:aplikasiwisata/pages/destination_detail4.dart'; // Import the fourth detail page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journey Awaits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/destinationDetail': (context) => DestinationDetail(),
        '/destinationDetail2': (context) => DestinationDetail2(),
        '/destinationDetail3': (context) => DestinationDetail3(), // Add route for the third detail page
        '/destinationDetail4': (context) => DestinationDetail4(), // Add route for the fourth detail page
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:aplikasiwisata/login page/loginpage.dart';
import 'package:aplikasiwisata/pages/home_page.dart';
import 'package:aplikasiwisata/pages/destination_detail.dart';
import 'package:aplikasiwisata/pages/destination_detail2.dart';
import 'package:aplikasiwisata/pages/destination_detail3.dart';
import 'package:aplikasiwisata/pages/destination_detail4.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached || state == AppLifecycleState.paused) {
      _logoutUser();
    }
  }

  Future<void> _logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journey Awaits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while checking login status
            return SplashScreen(); // Replace with your splash screen widget
          } else if (snapshot.hasError) {
            // Handle any errors in retrieving the login status
            return Scaffold(
              body: Center(child: Text('Error checking login status')),
            );
          } else {
            // If logged in, show HomePage, otherwise show LoginPage
            bool isLoggedIn = snapshot.data ?? false;
            return isLoggedIn ? HomePage() : LoginPage();
          }
        },
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/destinationDetail': (context) => DestinationDetail(),
        '/destinationDetail2': (context) => DestinationDetail2(),
        '/destinationDetail3': (context) => DestinationDetail3(),
        '/destinationDetail4': (context) => DestinationDetail4(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Replace with your splash screen UI
      ),
    );
  }
}

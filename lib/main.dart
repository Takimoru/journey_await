import 'package:flutter/material.dart';
import 'package:aplikasiwisata/login page/loginpage.dart';
import 'package:aplikasiwisata/pages/home_page.dart';
import 'package:aplikasiwisata/pages/destination_detail.dart';
import 'package:aplikasiwisata/pages/destination_detail2.dart';
import 'package:aplikasiwisata/pages/destination_detail3.dart';
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
    if (state == AppLifecycleState.detached) {
      _logoutUser();
    }
  }

  Future<void> _logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('currentRoute');
    print('User logged out');
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }

  Future<String> _getCurrentRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentRoute = prefs.getString('currentRoute') ?? '/login';
    return currentRoute;
  }

  Future<void> _storeCurrentRoute(String route) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentRoute', route);
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
            return SplashScreen();
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error checking login status')),
            );
          } else {
            bool isLoggedIn = snapshot.data ?? false;
            if (!isLoggedIn) {
              return LoginPage();
            } else {
              return FutureBuilder<String>(
                future: _getCurrentRoute(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SplashScreen();
                  } else if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(child: Text('Error checking current route')),
                    );
                  } else {
                    String currentRoute = snapshot.data ?? '/home';
                    return Navigator(
                      initialRoute: currentRoute,
                      onGenerateRoute: (RouteSettings settings) {
                        WidgetBuilder builder;
                        switch (settings.name) {
                          case '/login':
                            builder = (BuildContext _) => LoginPage();
                            break;
                          case '/home':
                            builder = (BuildContext _) => HomePage();
                            break;
                          case '/destinationDetail':
                            builder = (BuildContext _) => DestinationDetail();
                            break;
                          case '/destinationDetail2':
                            builder = (BuildContext _) => DestinationDetail2();
                            break;
                          case '/destinationDetail3':
                            builder = (BuildContext _) => DestinationDetail3();
                            break;
                          default:
                            builder = (BuildContext _) => HomePage();
                        }
                        return MaterialPageRoute(builder: builder, settings: settings);
                      },
                    );
                  }
                },
              );
            }
          }
        },
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/destinationDetail': (context) => DestinationDetail(),
        '/destinationDetail2': (context) => DestinationDetail2(),
        '/destinationDetail3': (context) => DestinationDetail3(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

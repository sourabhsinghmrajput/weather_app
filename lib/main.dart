import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima - Weather App',
      theme: ThemeData.dark(),
      initialRoute: '/loadingscreen',
      routes: {
        '/loadingscreen': (context) => LoadingScreen(),
        '/city': (context) => CityScreen(),
      },
    );
  }
}

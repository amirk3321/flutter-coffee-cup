import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Cup',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

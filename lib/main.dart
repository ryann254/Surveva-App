import 'package:flutter/material.dart';
import 'package:surveva_app/pages/AnimationPage.dart';
import 'package:surveva_app/pages/LaunchPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final _loginState = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: 'SF-Pro-Display',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: _loginState ? const AnimationPage() : const LaunchPage(),
    );
  }
}
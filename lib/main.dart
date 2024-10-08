import 'package:flutter/material.dart';
import 'package:surveva_app/pages/AnimationPage.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const AnimationPage(),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        surface: Color(0xffF6F3EE),
        onSurface: Color(0xff090A0A),
        primary: Color(0xff317C7D),
        onPrimary: Color(0xffffffff),
        secondary: Color(0xff72777A),
        tertiary: Color(0xffE9E7E1),
        onTertiary: Color(0xff979C9E)
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xffffffff),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE9E7E1)),
          borderRadius: BorderRadius.circular(24)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE9E7E1)),
          borderRadius: BorderRadius.circular(24)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff090A0A)),
          borderRadius: BorderRadius.circular(24)
        ),
      ),
      fontFamily: 'SF-Pro-Display',
      useMaterial3: true,
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        surface: Color(0xff090A0A),
        onSurface: Color(0xffE3E5E5),
        primary: Color(0xff317C7D),
        onPrimary: Color(0xffffffff),
        secondary: Color(0xffCDCFD0),
        tertiary: Color(0xff202325),
        onTertiary: Color(0xff979C9E)
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xff202325),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff404446)),
          borderRadius: BorderRadius.circular(24)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff404446)),
          borderRadius: BorderRadius.circular(24)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE3E5E5)),
          borderRadius: BorderRadius.circular(24)
        ),
      ),
      fontFamily: 'SF-Pro-Display',
      useMaterial3: true,
    );
  }
}

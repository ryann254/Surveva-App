import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveva_app/pages/AnimationPage.dart';
import 'package:surveva_app/config/appTheme.dart';
import 'package:surveva_app/providers/signUpProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      // TODO: Change to system theme
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const AnimationPage(),
    );
  }
}

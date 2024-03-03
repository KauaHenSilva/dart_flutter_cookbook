import 'package:dart_flutter_cookbooks/routes/app_routes.dart';
import 'package:dart_flutter_cookbooks/screens/home_screen.dart';
import 'package:dart_flutter_cookbooks/screens/settting_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookbook App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.settings: (context) => const SetttingScreen(),
      },
    );
  }
}

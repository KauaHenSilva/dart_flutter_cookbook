import 'package:dart_flutter_cookbooks/models/settings.dart';
import 'package:dart_flutter_cookbooks/routes/app_routes.dart';
import 'package:dart_flutter_cookbooks/screens/home_screen.dart';
import 'package:dart_flutter_cookbooks/screens/meals_list_screen.dart';
import 'package:dart_flutter_cookbooks/screens/settting_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookbook App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.settings: (context) => SetttingScreen(settings: settings),
        AppRoutes.mealsList: (context) => MealsListScreen(settings: settings),
      },
    );
  }
}

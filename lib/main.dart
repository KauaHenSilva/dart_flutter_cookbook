import 'package:dart_flutter_cookbooks/models/meal.dart';
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
  List<Meal> favorityFood = [];

  @override
  void initState() {
    super.initState();
    favorityFood = favorityFood;
  }

  void _updateFavoriteMeals(Meal meal) {
    setState(() {
      if (favorityFood.contains(meal)) {
        favorityFood.remove(meal);
      } else {
        favorityFood.add(meal);
      }
    });
  }

  void _updateSettings(Settings settings) {
    setState(() {
      this.settings = settings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookbook App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        AppRoutes.home: (context) => HomeScreen(
              onToggleFavorite: _updateFavoriteMeals,
              favorityMeals: favorityFood,
              settings: settings,
            ),
        AppRoutes.settings: (context) => SetttingScreen(
              settings: settings,
              onSettingsChanged: _updateSettings,
            ),
        AppRoutes.mealsList: (context) => MealsListScreen(
              settings: settings,
              mealsFavorite: favorityFood,
              onToggleFavorite: _updateFavoriteMeals,
            ),
      },
    );
  }
}

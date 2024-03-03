import 'package:dart_flutter_cookbooks/components/my_list_food.dart';
import 'package:dart_flutter_cookbooks/data/dummy_data.dart';
import 'package:dart_flutter_cookbooks/models/category.dart';
import 'package:dart_flutter_cookbooks/models/meal.dart';
import 'package:dart_flutter_cookbooks/models/settings.dart';
import 'package:flutter/material.dart';

class MealsListScreen extends StatefulWidget {
  final Settings settings;
  final List<Meal> mealsFavorite;
  final Function(Meal) onToggleFavorite;
  const MealsListScreen(
      {Key? key,
      required this.settings,
      required this.mealsFavorite,
      required this.onToggleFavorite})
      : super(key: key);

  @override
  State<MealsListScreen> createState() => _MealsListScreenState();
}

class _MealsListScreenState extends State<MealsListScreen> {
  late List<Meal> mealsFavorite;

  @override
  void initState() {
    super.initState();
    mealsFavorite = widget.mealsFavorite;
  }

  List<Meal> get mealsFiltradConfig {
    return dummyMeals.where((meal) {
      if (widget.settings.isGlutenFree && !meal.isGlutenFree) {
        return false;
      }
      if (widget.settings.isLactoseFree && !meal.isLactoseFree) {
        return false;
      }
      if (widget.settings.isVegan && !meal.isVegan) {
        return false;
      }
      if (widget.settings.isVegetarian && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    List<Meal> mealsFiltradFinal = mealsFiltradConfig
        .where((element) => element.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: mealsFiltradFinal.length,
        itemBuilder: (ctx, index) {
          return MyListFood(
            meal: mealsFiltradFinal[index],
            onToggleFavorite: widget.onToggleFavorite,
            mealsFavorite: mealsFavorite,
          );
        },
      ),
    );
  }
}

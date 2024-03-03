import 'package:dart_flutter_cookbooks/data/dummy_data.dart';
import 'package:dart_flutter_cookbooks/models/category.dart';
import 'package:dart_flutter_cookbooks/models/meal.dart';
import 'package:dart_flutter_cookbooks/models/settings.dart';
import 'package:flutter/material.dart';

class MealsListScreen extends StatefulWidget {
  final Settings settings;
  const MealsListScreen({Key? key, required this.settings}) : super(key: key);

  @override
  State<MealsListScreen> createState() => _MealsListScreenState();
}

class _MealsListScreenState extends State<MealsListScreen> {
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

    Widget creatMealsList(List<Meal> meals) {
      if (meals.isEmpty) {
        return const Center(
          child: Text('No meals found!'),
        );
      }

      return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Image.network(
              height: 400,
              width: 100,
              meals[i].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(meals[i].title),
          subtitle: Text(meals[i].complexityText),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: creatMealsList(mealsFiltradFinal));
  }
}

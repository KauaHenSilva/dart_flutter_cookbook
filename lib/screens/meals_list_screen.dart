import 'package:dart_flutter_cookbooks/data/dummy_data.dart';
import 'package:dart_flutter_cookbooks/models/category.dart';
import 'package:dart_flutter_cookbooks/models/meal.dart';
import 'package:flutter/material.dart';

class MealsListScreen extends StatelessWidget {
  const MealsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    final List<Meal> meals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

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
        body: creatMealsList(meals));
  }
}

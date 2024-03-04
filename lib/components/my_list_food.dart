import 'package:dart_flutter_cookbooks/models/meal.dart';
import 'package:dart_flutter_cookbooks/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyListFood extends StatelessWidget {
  final Meal meal;
  final List<Meal> mealsFavorite;
  final Function(Meal) onToggleFavorite;
  const MyListFood(
      {Key? key,
      required this.meal,
      required this.onToggleFavorite,
      required this.mealsFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Image.network(
          height: 400,
          width: 100,
          meal.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(meal.title),
      subtitle: Text(meal.complexityText),
      trailing: mealsFavorite.contains(meal)
          ? IconButton(
              icon: const Icon(Icons.star),
              onPressed: () => onToggleFavorite(meal),
            )
          : IconButton(
              icon: const Icon(Icons.star_border),
              onPressed: () => onToggleFavorite(meal),
            ),
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.mealDetail,
        arguments: meal,
      )
    );
  }
}

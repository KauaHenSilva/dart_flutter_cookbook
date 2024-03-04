import 'package:dart_flutter_cookbooks/components/my_drawer.dart';
import 'package:dart_flutter_cookbooks/components/my_list_food.dart';
import 'package:dart_flutter_cookbooks/data/dummy_data.dart';
import 'package:dart_flutter_cookbooks/models/category.dart';
import 'package:dart_flutter_cookbooks/models/meal.dart';
import 'package:dart_flutter_cookbooks/models/settings.dart';
import 'package:dart_flutter_cookbooks/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Settings settings;
  final List<Meal> favorityMeals;
  final Function(Meal) onToggleFavorite;
  const HomeScreen(
      {Key? key,
      required this.settings,
      required this.favorityMeals,
      required this.onToggleFavorite})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Meal> get filteredFavoriteMeals {
    return widget.favorityMeals.where((meal) {
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

  Widget _createGridCategoryView(List<Category> category, BuildContext ctx) {
    final bool orient = MediaQuery.of(ctx).orientation == Orientation.landscape;

    return GridView.builder(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: orient ? 5 : 2,
        mainAxisExtent: orient ? 200 : 150,
        childAspectRatio: orient ? 3 / 2 : 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: category.length,
      itemBuilder: (ctx, i) => InkWell(
        onTap: () {
          Navigator.of(ctx).pushNamed(
            AppRoutes.mealsList,
            arguments: category[i],
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: category[i].color,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category[i].color.withOpacity(0.7),
                category[i].color,
              ],
            ),
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          child: Text(category[i].title),
        ),
      ),
    );
  }

  Widget _createListFavoriteView(List<Meal> filteredFavoriteMeals) {
    return ListView.builder(
        itemCount: filteredFavoriteMeals.length,
        itemBuilder: (ctx, i) {
          return MyListFood(
            meal: filteredFavoriteMeals[i],
            mealsFavorite: filteredFavoriteMeals,
            onToggleFavorite: widget.onToggleFavorite,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categorias',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favoritos',
                ),
              ],
            )),
        body: TabBarView(
          children: [
            _createGridCategoryView(dummyCategories, context),
            _createListFavoriteView(filteredFavoriteMeals),
          ],
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}

import 'package:dart_flutter_cookbooks/models/meal.dart';
import 'package:flutter/material.dart';

class MealDatail extends StatefulWidget {
  const MealDatail({Key? key}) : super(key: key);

  @override
  _MealDatailState createState() => _MealDatailState();
}

class _MealDatailState extends State<MealDatail> {
  late PageController pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  Widget _creatListPasesView(Meal meal) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(25),
          child: Text('Passos', style: TextStyle(fontSize: 20)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: meal.steps.length,
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${i + 1}'),
                    ),
                    title: Text(meal.steps[i]),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _creatListIgredientView(Meal meal) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.all(25),
            child: Text('Ingredintes', style: TextStyle(fontSize: 20))),
        Expanded(
          child: ListView.builder(
            itemCount: meal.ingredients.length,
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${i + 1}'),
                    ),
                    title: Text(meal.ingredients[i]),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Refeição'),
      ),
      body: Card(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: [
                  _creatListIgredientView(meal),
                  _creatListPasesView(meal),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Ingredientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Passos',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

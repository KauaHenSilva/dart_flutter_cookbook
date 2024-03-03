import 'package:dart_flutter_cookbooks/components/my_drawer.dart';
import 'package:dart_flutter_cookbooks/data/dummy_data.dart';
import 'package:dart_flutter_cookbooks/models/category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _creatGridCategory(List<Category> categories) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (ctx, i) => InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: categories[i].color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(categories[i].title),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Home Screen'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.restaurant_menu), text: 'Restaurants'),
                Tab(icon: Icon(Icons.favorite), text: 'Favorite'),
              ],
            )),
        drawer: const MyDrawer(),
        body: TabBarView(
          children: [
            _creatGridCategory(dummyCategories),
            const Center(child: Text('Favorite')),
          ],
        ),
      ),
    );
  }
}

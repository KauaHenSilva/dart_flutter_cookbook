import 'package:dart_flutter_cookbooks/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        body: const TabBarView(
          children: [
            Center(child: Text('Home')),
            Center(child: Text('Favorite')),
          ],
        ),
      ),
    );
  }
}

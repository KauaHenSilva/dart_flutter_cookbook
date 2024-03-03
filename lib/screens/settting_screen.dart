import 'package:dart_flutter_cookbooks/models/settings.dart';
import 'package:flutter/material.dart';

class SetttingScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SetttingScreen(
      {Key? key, required this.settings, required this.onSettingsChanged})
      : super(key: key);

  @override
  State<SetttingScreen> createState() => _SetttingScreenState();
}

class _SetttingScreenState extends State<SetttingScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Sem Glutén'),
              subtitle: const Text('Só exibe refeições sem glúten!'),
              value: settings.isGlutenFree,
              onChanged: (value) {
                setState(() {
                  settings.isGlutenFree = value;
                });
                widget.onSettingsChanged(settings);
              },
            ),
            SwitchListTile(
              title: const Text('Sem Lactose'),
              subtitle: const Text('Só exibe refeições sem lactose!'),
              value: settings.isLactoseFree,
              onChanged: (value) {
                setState(() {
                  settings.isLactoseFree = value;
                });
                widget.onSettingsChanged(settings);
              },
            ),
            SwitchListTile(
              title: const Text('Vegana'),
              subtitle: const Text('Só exibe refeições veganas!'),
              value: settings.isVegan,
              onChanged: (value) {
                setState(() {
                  settings.isVegan = value;
                });
                widget.onSettingsChanged(settings);
              },
            ),
            SwitchListTile(
              title: const Text('Vegetariana'),
              subtitle: const Text('Só exibe refeições vegetarianas!'),
              value: settings.isVegetarian,
              onChanged: (value) {
                setState(() {
                  settings.isVegetarian = value;
                });
                widget.onSettingsChanged(settings);
              },
            ),
          ],
        ),
      ),
    );
  }
}

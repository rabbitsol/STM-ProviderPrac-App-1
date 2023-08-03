import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1prac/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Changer App'), centerTitle: true),
      body: Column(children: [
        RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themeChangerProvider.themeMode,
            onChanged: (value) {
              themeChangerProvider.setTheme(value!);
            }),
        RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themeChangerProvider.themeMode,
            onChanged: (value) {
              themeChangerProvider.setTheme(value!);
            }),
        RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChangerProvider.themeMode,
            onChanged: (value) {
              themeChangerProvider.setTheme(value!);
            }),
        const Icon(Icons.favorite)
      ]),
    );
  }
}

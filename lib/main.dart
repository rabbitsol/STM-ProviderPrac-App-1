import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1prac/provider/auth_provider.dart';
import 'package:provider1prac/provider/count_provider.dart';
import 'package:provider1prac/provider/example_one_provider.dart';
import 'package:provider1prac/provider/favourite_provider.dart';
import 'package:provider1prac/provider/theme_changer_provider.dart';
import 'package:provider1prac/screen/count_example.dart';
import 'package:provider1prac/screen/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),

        ],
        child: Builder(
          builder: (context) {
            final themeChangerProvider =
                Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: themeChangerProvider.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.pink,
                primaryColor: Colors.blue,
                iconTheme: const IconThemeData(color: Colors.red),
                appBarTheme: const AppBarTheme(color: Colors.deepPurple),
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.yellow,
                  primaryColor: Colors.purple,
                  appBarTheme: const AppBarTheme(color: Colors.deepOrange),
                  
                  iconTheme: const IconThemeData(
                      color: Color.fromARGB(255, 233, 224, 221))),
              home: const CountExampleProvider(),
            );
          },
        ));
  }
}

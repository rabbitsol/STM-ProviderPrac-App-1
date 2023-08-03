import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1prac/provider/example_one_provider.dart';
import 'package:provider1prac/provider/favourite_provider.dart';
import 'package:provider1prac/screen/dark_theme.dart';
import 'package:provider1prac/screen/favourite/favourite_screen.dart';
import 'package:provider1prac/screen/notify_listener_screen.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      appBar:
          AppBar(title: const Text('ProviderExampleOne'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<ExampleOneProvider>(builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setvalue(val);
                  });
            }),
            Consumer<ExampleOneProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(value.value)),
                    child: const Center(child: Text("Pink")),
                  )),
                  Expanded(
                      child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: const Center(child: Text("Green")),
                  )),
                ],
              );
            }),
            const SizedBox(height: 100),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FavouriteScreen()),
                          );
                        },
                        child: const Text('Move to Favourite App'))),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DarkThemeScreen()),
                          );
                        },
                        child: const Text('Move to Theme Changer App'))),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     NotifyListenerScreen()),
                          );
                        },
                        child: const Text('Move to Notify Listener App'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

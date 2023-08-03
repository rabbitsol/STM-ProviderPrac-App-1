import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1prac/provider/count_provider.dart';
import 'package:provider1prac/screen/example_one.dart';

class CountExampleProvider extends StatefulWidget {
  const CountExampleProvider({super.key});

  @override
  State<CountExampleProvider> createState() => _CountExampleProviderState();
}

class _CountExampleProviderState extends State<CountExampleProvider> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 2), (timer) {
      countProvider.setcount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    // print('only this value builds');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProviderExample1'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CountProvider>(builder: (context, value, child) {
            // print('only this value prints');
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 50),
            );
          }),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(100)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExampleOne()),
                        );
                      },
                      child: const Text('Move to Example One'))),
            ],
          )
        ],
      )
          // Text(countProvider.count.toString()),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setcount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

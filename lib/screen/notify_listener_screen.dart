import 'package:flutter/material.dart';
import 'package:provider1prac/screen/login_screen.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> pass = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Notify Listener App'), centerTitle: true),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: pass,
                builder: (context, value, child) {
                  return TextFormField(
                      obscureText: pass.value,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffix: InkWell(
                            onTap: () {
                              pass.value = !pass.value;
                            },
                            child: Icon(pass.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility),
                          )));
                }),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreenUsingAPI()));
                },
                child: const Text('Login')),
            Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(_counter.value.toString(),
                        style: const TextStyle(fontSize: 50));
                  }),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter.value++;
          },
          child: const Icon(Icons.add)),
    );
  }
}

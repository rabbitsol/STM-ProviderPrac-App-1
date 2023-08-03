import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1prac/provider/auth_provider.dart';

class LoginScreenUsingAPI extends StatefulWidget {
  const LoginScreenUsingAPI({super.key});

  @override
  State<LoginScreenUsingAPI> createState() => _LoginScreenUsingAPIState();
}

class _LoginScreenUsingAPIState extends State<LoginScreenUsingAPI> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  ValueNotifier<bool> pass = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login Using Rest API with Provider'),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable: pass,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: pass.value,
                    controller: passController,
                    decoration: InputDecoration(
                        hintText: 'password',
                        suffix: InkWell(
                          onTap: () {
                            pass.value = !pass.value;
                          },
                          child: Icon(pass.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                  );
                }),
            // },
            // child:
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                authProvider.login(emailController.text.toString(),
                    passController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple),
                child: Center(
                  child: authProvider.loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:login/login.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;

  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: ValueListenableBuilder<LoginState>(
            valueListenable: controller,
            builder: (context, state, __) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(labelText: 'Senha'),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: controller.login,
                          child: const Text('Login')),
                    ],
                  ),
                );
              }
            }),
      );
}

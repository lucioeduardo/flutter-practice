import 'package:flutter/material.dart';

class AboutInnerPage extends StatelessWidget {
  const AboutInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inner'),
      ),
      body: const Column(
        children: [
          Text("Teste"),
        ],
      ),
    );
  }
}

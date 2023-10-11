import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is an app to test GoRouter'),
            ElevatedButton(onPressed: () => context.push('/about/inner'), child: const Text("Details")),
            ElevatedButton(onPressed: () => context.go('/'), child: const Text("Home"))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutDetailsPage extends StatelessWidget {
  const AboutDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About - Details'),
      ),
      body: const Center(
        child: Text("Just a test"),
      ),
    );
  }
}

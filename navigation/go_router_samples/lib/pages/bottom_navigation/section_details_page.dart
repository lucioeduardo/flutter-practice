import 'package:flutter/material.dart';

class SectionDetailsPage extends StatelessWidget {
  final String label;

  const SectionDetailsPage({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalhes $label'),
        ),
        body: const Center(
          child: Text('The details page.'),
        ));
  }
}
